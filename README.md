# Application to calculate tax sales

## Structure
The application uses a directory structure with `classes`, `helpers`, and `services` directories for organizing code files.
The `load_paths.rb` file is located in the root directory of the project and is responsible for requiring all necessary files.

## Instructions to run the app

To run this app you must have ruby installed (Ruby 3.1.0 was used for development)
To run the app execute the following command
```
ruby lib/app.rb
```

there are 3 available options
<ol>
<li> Enter items manually </li>
<li> Use testing inputs </li>
<li> Load items from file </li>
</ol>

use the option 2 to quickly test all basic cases

## Instruction to run rspec tests

### Install dependencies
```
bundle install
```
Run all the unit tests by running
```
bundle exec rspec
```
if you wanna run a specific unit test do the following
```
bundle exec rspec spec/classes/receipt_spec.rb 
```