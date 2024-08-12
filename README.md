# Sales Tax Calculator Application

## Structure
The application uses a directory structure with `classes`(Item and Receipt), `helpers`(organize code and to have DRY code), and `services`(Encapsulate business logic) directories for organizing code files.

The `load_paths.rb` file is located in the root directory of the project and is responsible for requiring all necessary files.

## Running the Application

To run the application, ensure Ruby is installed on your system. The application was developed using Ruby 3.1.0.

Run the application:
```
ruby lib/app.rb
```

there are 3 available options
<ol>
<li> Enter items manually </li>
<li> Use testing inputs </li>
<li> Load items from file </li>
</ol>

For quick testing of basic cases, use option 2 (testing inputs).

## Instruction to run rspec tests

### Install dependencies
Before running tests, install the required gems:
```
bundle install
```
To execute all unit tests:
```
bundle exec rspec
```
if you wanna run a specific unit test, specify the test file:
```
bundle exec rspec spec/classes/receipt_spec.rb 
```
Replace spec/classes/receipt_spec.rb with the path to the test file you want to run.
