# Tara Notes

1. I believe in Rails 4.x one can do change_column, and Rails knows
   all_the_things and retains the former data. If I am mistaken (I am open to
   this possibility), then what I would REALLY do is add_column with encryption
   attributes, and then I'd map the old data to the new column name. And after
   another cup of coffee (and probably a fellow colleague check) I'd drop the
   old column that no longer be relevant.

2. I am not going to spend the time on it for the challenge (but will in a
   follow up if you need me to) I'd restrict the scope to private for most of
   the lead.rb model.

3. Another thing I'd do with more time and for a real codebase is clean up the
   encryption on the lead.rb. Right now, they're on separate lines to generate
   a different key for each, but I'd either encrypt all contact details OR at
   least DRY up the encryption with random encryption_generators. At least you
   know what I thought about doing! :-)

4. I'm not happy with my testing for the password on the PDF. This would be the
   kind of thing where I said to one of my co-workers, "Hey, I don't do this
   often. What do you think my best approach is here?" And then, we would pair.
   It would be great. In any case, I learned to code/TDD using RSpec, but for
   the past two years, I've been using MiniTest. So, mostly, I need to remind
   myself of all_the_things RSpec can do. If you hired me, I would do that.

5. I have not made RuboCop (or myself) entirely happy. I will embrace its love
   of the described_class. Also, if I had more time, I'd have made that form
   look...like a form.

6. Speaking of time, I am leaving for a planned vacation tomorrow (probably
   today when you see this). It's primarily a road trip and visiting with
   friends, which is to say that even if I wanted to, it would be EXTREMELY
   difficult to respond (with code) to comments on my PR. In fact, I'm going
   to try very hard NOT to do so, because that will likely lead to a tired
   driver, and that's no good.

   I will be responding to general inquiries via email and/or phone while I'm
   gone, but I will generally be unavailable for extended conversations/travel
   until after I get back--first day of availability will be Tuesday, April 5,
   a little over a week from now. I hope that is not too disruptive in your
   interviewing timeline! Oh, and I am happy to make/confirm appointments while
   I'm traveling. In fact, I've updated my calendar, and I believe I've set it
   up to accept appointment requests, so feel free: taratirzah@gmail.com