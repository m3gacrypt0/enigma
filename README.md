# enigma
## Enigma Final Individual Project Module 1: Allison Moore
---
## Self Assessment
Based on the provided evaluation rubric, I assess my project at a **3.75** average score. Details of each score are below.

| Score | Evaluation Metric | Specific Notes |
| ----------- | ----------- | ----------- |
| 3 | Functionality | Enigma Class with encrypt and decrypt methods are successfully implemented. Encrypt/decrypt CLI interfaces successfully implemented. Did not attempt the `cracking` method and CLI so that I could focus on the quality of other metrics in the project in the limited time. |
| 4 | Object Oriented Programming | Project is broken down into 4 classes (`Enigma`, `RandomNumber`, `OutputFile`, and `CharacterGenerator`) and 1 module (`Cryptable`) all with single responsibilities (see below). All methods are less than 8 lines of code, all classes are less than 100 lines, and all lines of code are less than 80 characters. Several classes use class methods successfully, such as: `RandomNumber.generate`, `OutputFile.generate` and `Date.today`. Variable and method names always clearly communicate purpose (`encrypt`, `get_shifted_character`, `orig_message` and `new_message`). The RandomNumber, OutputFile and Date Classes as well as the Cryptable Module could be used outside of the Enigma project. |
| 4 | TDD | Git history demonstrates the process of writing tests before implementation of code with 100% test coverage for targeted code (and 71.43% test coverage for CLI using mocks and stubs). Further, all test names clearly communicate the purpose of the test. Examples include: `test_method_encrypt` `test_method_get_shifted_character` and `test_method_get_rotate`. At least one test implements mocks and stubs (see `output_file_test.rb` for tests 'test_method_encrypt_work' and `test_method_decrypt_work`).  |
| 4 | Version Control | Project has over 40 commits (69 currently) and at least 15 pull requests (17 currently) from a branch other than master (`dev`) to the master branch. All commits and pull requests  are clearly named to communicate purpose. For example, sample pull request titles include: `Add functionality for Encryptable module and Enigma Class` and `Update decrypt.rb file with working decrypt CLI functionality`. Additionally, no commits include multiple pieces of functionality or are ambiguous. |
---
## Class and Module Responsibilities
### Enigma Class `Enigma.new`
Enigma Class includes Cryptable Module and encrypts or decrypts messages.
### RandomNumber Class `RandomNumber.new` `RandomNumber.generate(length)`
RandomNumber Class generates a string representing a random number of any length from the range (0...9). Leading zeros are allowed.
### OutputFile Class `OutputFile.new` `OutputFile.generate(path, message, type = 'e', key = nil, date = nil)`
OutputFile Class generates the contents of the output file for a call to the enigma machine to encrypt or decrypt a text file and outputs the status of the file generation to the terminal.  
`Created '#{path}' with the key #{key} and date #{date}`
### CharacterGenerator Class `CharacterGenerator.new`
CharacterGenerator Class includes Cryptable Module and shifts the theoretical 'dials' of the enigma machine and outputs the shifted character for the encrypted/decrypted message based on shifts generated in the Cryptable Module. CharacterGenerator Class defines the character set and shift set of the 'dials'.
```
@char_set           = ("a".."z").to_a << " "
@shift_set          = [:a, :b, :c, :d]
```
### Cryptable Module
Cryptable Module provides functionality for the Engima Class and CharacterGenerator Class to determine the desired shifts and offsets based on the desired key and date combination for the message.

## Further Development
1. Validation for dates supplied.
2. Random generation of dates if none supplied.
3. Dynamic character sets.
4. Testing for complete CLI interface.
5. Validation of file path and state in CLI interface.
