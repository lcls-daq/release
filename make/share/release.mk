# Top level makefile
# ------------------
Makefile:;

# Symbols
# -------
SHELL := /bin/bash

# Minimal directory tree
tree_dirs = build

# Rules
# -----
.PHONY: dir cleanall $(projects) $(projects.%)

dir: $(tree_dirs);
$(tree_dirs):
	@echo "[DR] Target <dir> at top level";
	$(quiet)mkdir -p $@

cleanall:
	@echo "[CL] Target <cleanall> at top level";
	$(quiet)$(RM) -r build

define soft-link
  if [ ! -e $(1) ] || [ `readlink $(1)` != $(2) ]; then \
    if [ -e $(2) ]; then \
      if [ ! -z $(2) ]; then \
        echo '[SL] Make soft link $(1) $(2)'; \
        rm -f $(1);     \
        ln -s $(2) $(1);     \
      fi \
    else \
      echo '[SL] *** project $(2) not found'; \
    fi \
  fi
endef

define build-libo-dir
  if [ ! -z $(2) ]; then \
    $(call soft-link,$(1),$(2)-opt/lib); \
    $(call soft-link,$(1)-opt,$(2)-opt/lib); \
    $(call soft-link,$(1)-dbg,$(2)-dbg/lib); \
  fi
endef

define build-lib-dir
  if [ ! -z $(2) ]; then \
    $(call soft-link,$(1),$(2)); \
    $(call soft-link,$(1)-opt,$(2)); \
    $(call soft-link,$(1)-dbg,$(2)); \
  fi
endef

define build-ext-dir
  if [ ! -e $(1) ]; then \
    echo '[XD] Make external link directory $(1)'; \
    mkdir -p $(1); \
    mkdir -p $(1)/lib; \
  fi; \
  $(call soft-link,$(1)/include,$($(2)_use_include)); \
  $(call build-libo-dir,$(1)/lib/i386-linux,$($(2)_use_i386)); \
  $(call build-libo-dir,$(1)/lib/x86_64-linux,$($(2)_use_x86_64)); \
  $(call build-libo-dir,$(1)/lib/x86_64-rhel6,$($(2)_use_x86_64)); \
  $(call build-libo-dir,$(1)/lib/x86_64-rhel7,$($(2)_use_rhel7)); \
  $(call build-lib-dir,$(1)/lib/x86_64-linux,$($(2)_use_lib_x86_64)); \
  $(call build-lib-dir,$(1)/lib/x86_64-rhel6,$($(2)_use_lib_x86_64))
  $(call build-lib-dir,$(1)/lib/x86_64-rhel7,$($(2)_use_lib_rhel7))
endef

#    $(call soft-link,$(1)/lib/$$arch,$($(2)_use_lib_$$arch)); 

define delete-soft-links
  for prj in $(projects); do \
    if [ -h build/$$prj ]; then    \
       $(RM) build/$$prj;          \
    fi;                      \
  done
endef

define project_template
ifeq ($$(strip $$($(1)_use)),release)
$(1).%: dir
	$(quiet)echo "[PR] Target <$$*> project <$(1)>"
	$$(MAKE) -C $(1) $$*
else
ifneq ($$(findstring /,$$($(1)_use_include),),)
$(1).%: dir
	@$$(call build-ext-dir,build/$(1),$(1))
else
ifneq ($$(findstring /,$$($(1)_use),),)
$(1).%: dir
	@$$(call soft-link,build/$(1),$$($(1)_use))
else
$$(error 'Project $(1) lacks a use statement')
endif
endif
endif
endef

# revisit release_base
# $(1).%: dir
# 	@$$(call soft-link,build/$(1),$$(release_base)/$(1))

$(foreach prj,$(projects),$(eval $(call project_template,$(prj))))

ifeq ($(FAILONERR),true)
define all-projects
  for prj in $(projects); do     \
    $(MAKE) $$prj.$* || exit $?; \
  done
endef
else
define all-projects
  for prj in $(projects); do \
    $(MAKE) $$prj.$*;        \
  done
endef
endif

%:; @$(all-projects)
