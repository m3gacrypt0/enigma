# enigma
## Enigma Final Individual Project Module 1: Allison Moore
---
## Self Assessment
Based on the provided evaluation rubric, I assess my project at a **3.75** average score. Details of each score are below.

| Score | Evaluation Metric | Specific Notes |
| ----------- | ----------- | ----------- |
| 3 | Functionality | Enigma Class with encrypt and decrypt methods are successfully implemented. Encrypt/decrypt CLI interfaces successfully implemented. Did not attempt the `cracking` method and CLI so that I could focus on the quality of other metrics in the project in the limited time. |
| 4 | Object Oriented Programming | Project is broken down into 4 classes (`Enigma`, `RandomNumber`, `OutputFile`, and `CharacterGenerator`) and 1 module (`Cryptable`) all with single responsibilities (see below). All methods are less than 8 lines of code, all classes are less than 100 lines, and all lines of code are less than 80 characters. Several classes use class methods successfully, such as: `RandomNumber.generate`, `OutputFile.generate` and `Date.today`. Variable and method names always clearly communicate purpose (`encrypt`, `get_shifted_character`, `orig_message` and `new_message`). The RandomNumber, OutputFile and Date Classes as well as the Cryptable Module are easily used outside of the Enigma project. |
| 4 | TDD | Git history demonstrates the process of writing tests before implementation of code with 100% test coverage. Further, all test names clearly communicate the purpose of the test. Examples include: `test_method_encrypt` `test_method_get_shifted_character` and `test_method_get_rotate`. At least one test implements mocks and stubs (see `output_file_test.rb` for tests 'test_method_encrypt_work' and `test_method_decrypt_work`).  |
| 4 | Version Control | Project has over 40 commits and at least 15 pull requests from a branch other than master to the master branch. All commits and pull requests  are clearly named to communicate purpose. For example, some pull request titles include: `Add functionality for Encryptable module and Enigma Class` and `Update decrypt.rb file with working decrypt CLI functionality`. Additionally, no commits include multiple pieces of functionality or are ambiguous. |
---
## Class and Module Responsibilities
### Enigma Class
### RandomNumber Class
### OutputFile Class
### CharacterGenerator Class
### Cryptable Module

## Notes of Issues for Further Development
