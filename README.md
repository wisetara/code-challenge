# Ruby On Rails Lead Form

## Installing dependencies
1. Ensure you have ruby 2.3.0 installed
1. Ensure you have sqlite3 installed
1. `bundle install`
1. `bin/rspec` to run the tests
1. `bin/rubocop` to check for code style
1. `bin/rails s` to start the server


## Guidance + Feedback!
0. If you ever get stuck, have a question, or what not; make sure to *email your interviewer* and ask them questions! They are always happy to provide clarification and guidance!
1. We use `rubocop` to provide automated code style review. We recommend running `bin/rubocop` before submitting your code to ensure you don't violate any of the [ruby style guide](https://github.com/bbatsov/ruby-style-guide).
2. While we understand that writing automated tests for every feature may be a bit beyond your reach; we'd love it if you included a "manual test plan" in cases where you struggle to write an automated test.
3. This is very much an "Alpha" project; so some of these features may be a bit much to ask for someone just trying to demonstrate their ability to write ruby + rails code for a team.


## Features to Build
This is a full-stack challenge where we ask you to complete the following features:

### Feature Set 1: "Warm up!"
1. Add a "Title" drop down to the "Personal Details" step
2. Write a "feature test" to ensure that a user can select a title and still submit the lead

### Feature set 2: "Encrypt!"
1. When a lead is saved, ensure that any personally identifying information for the lead (email, name, contact info, etc.) are encrypted in the database. Consider using a tool such as [attr_encrypted](https://github.com/attr-encrypted/attr_encrypted)
2. Write a manual test plan to verify that the personal data is encrypted in the database.

### Feature set 3: "PDFify!"
1. When a lead is created, create a password protected PDF using a gem such as [prawn](https://github.com/prawnpdf/prawn). This pdf should include all lead attributes.
2. (For now, write the PDF to the file system)
3. Write a manual test plan to verify that the PDF is encrypted + password protected

### Feature set 4: "Archive!"
1. When a lead is created, attach the uploaded PDF to an S3 bucket on Amazon. Consider using a tool such as [paperclip](https://github.com/thoughtbot/paperclip) or [refile](https://github.com/refile/refile) with [refile-s3](https://github.com/refile/refile-s3)
