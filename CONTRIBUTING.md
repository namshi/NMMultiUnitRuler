# Contributing to NMMultiUnitRuler

If you would like to contribute code you can do so through GitHub by forking the repository and sending a pull request.

When submitting code, please follow existing conventions and style in order to keep readability of the code high.

## Pull requests
**_Before_** creating a pull request:

* Updated to the latest version of the _master_ branch (and branch out from that to avoid conflicts).
* _NMMultiUnitRuler_ and _NMMultiUnitRulerExample_ schemes compile successfully.
* All new files should start from _NM_ prefix.
* If defining new feature, then write unit tests and make sure all unit tests in _NMMultiUnitRulerTests_ project pass
* The pull request contains a meaningful description explaining the problem the change solves and how the solution works

*Tests & documentation*

* When adding new functionality all the relevant use cases are covered with new unit tests
* When making bugfixes, the changes covered by new unit tests (or existing ones modified accordingly)
* New files contain the common license header (please see below).
* New classes and methods contain enough documentation to understand their purpose

## Issues
If you find a bug in the project (and you don’t know how to fix it), have trouble following the documentation or have a question about the project, then please create an issue. Some tips [from the GitHub Guide](https://guides.github.com/activities/contributing-to-open-source/):

* Check existing issues for the problem you're seeing. Duplicating an issue is slower for both parties so search through open and closed issues to see if what you’re running in to has been addressed already.
* Be clear about what your problem is: what was the expected outcome, what happened instead? Detail how someone else can recreate the problem.
* Include system details like the browser, library or operating system you’re using and its version.
* Paste error output or logs in your issue or in a Gist. If pasting them in the issue, wrap it in three backticks: ``` so that it renders nicely.

## Contact
In case of major changes please feel free to reach out to the maintainers of the project at any time - we will be happy to help.

* Mobile Dev Team at Namshi (mobile-dev@namshi.com, [@TechNamshi](https://twitter.com/TechNamshi))

## License

By contributing your code, you agree to license your contribution under the terms of the MIT: https://github.com/namshi/NMMultiUnitRuler/blob/master/LICENSE

All files are released with the MIT license.

If you are adding a new file, the name should start with the prefix _NM_ and it should have a header like this:

```
//
//  <NMfile_name>.swift
//  NMMultiUnitRuler
//
//  Created by <author_name> on <mm/dd/yy>.
//
//  Copyright © 2019 NAMSHI. All rights reserved.
//
```
