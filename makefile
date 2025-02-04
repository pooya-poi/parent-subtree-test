# variables
REPO_URL=https://github.com/pooya-poi/child-subtree-test.git
SUBTREE_PREFIX=src/shared-directory
BRANCH=main

# pull or push based on the 'pull' and 'push' variable:
shared-directory:
ifeq ($(pull), true)
	git subtree pull --prefix=$(SUBTREE_PREFIX) $(REPO_URL) $(BRANCH) --squash
endif
ifeq ($(push), true)
	git subtree push --prefix=$(SUBTREE_PREFIX) $(REPO_URL) $(BRANCH)
endif
