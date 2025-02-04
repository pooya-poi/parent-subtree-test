# Variables
REPO_URL=https://github.com/pooya-poi/child-subtree-test.git
SUBTREE_PREFIX=shared-directory
BRANCH=main

# Target for managing the subtree (either pull or push based on the 'pull' variable)
shared-directory:
ifeq ($(pull), true)
	git subtree pull --prefix=$(SUBTREE_PREFIX) $(REPO_URL) $(BRANCH) --squash
endif
ifeq($(push), true)
	git subtree push --prefix=$(SUBTREE_PREFIX) $(REPO_URL) $(BRANCH)
endif
