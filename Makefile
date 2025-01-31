.PHONY: init test

init:
	pip install -r requirements.txt

test:
	py.test tests

.venv: # creates virtual environment (detectable by vscode)
	python3 -m venv $@
	$@/bin/pip3 --quiet install --upgrade \
		pip \
		wheel \
		setuptools
	@echo "To activate the venv, execute 'source .venv/bin/activate'"

.PHONY: docs
docs:
	pip install -r requirements/docs.txt
	mkdocs build
	mkdocs serve