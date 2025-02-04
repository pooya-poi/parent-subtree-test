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



# Add subtree to a temporary directory and move it to the root
add-subtree:
	# Step 1: Add the subtree to a temporary directory
	git subtree add --prefix=temp-subtree https://github.com/pooya-poi/child-subtree-test.git main --squash

	# Step 2: Move the contents of the temporary directory to the root
	git mv temp-subtree/* .
	git rm -rf temp-subtree

	# Step 3: Commit the changes
	git commit -m "Moved subtree contents to the root directory"

	@echo "Subtree added and moved to the root directory successfully!"