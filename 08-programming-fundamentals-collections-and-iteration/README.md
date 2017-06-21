# Programming Fundamentals:<br>Collections and Iteration
---

# Agenda

- Introduction <small>(5 min)</small>
- Arrays <small>(30 min)</small>
- Hashes <small>(20 min)</small>
- Hashes vs. Arrays <small>(10 mins)</small>
- Iteration <small>(40 min)</small>
- Further Resources and Wrap Up <small>(5 min)</small>

<br>

---

# Introduction

`Arrays` and `Hashes` are the two most common Ruby classes for holding collections (i.e. more than one object).

As you code, keep in mind whether you are working with a single item, or a collection of items.

<br>

---
# Arrays

## Definition

> Arrays are ordered, integer-indexed collections of any object.

## Documentation

https://ruby-doc.org/core-2.4.1/Array.html

- you can see where I got the definition from!

Here you'll find a list of useful array methods and how to use them.

## Enumerable

Notice on the left hand side of the Array documentation, there's a subtle **Included Modules** section which lists:
**Enumerable**

This means that the `Enumerable` functionality has been ***"Mixed In"*** (aka included) in the `Array` class.

In computer science,  ***Enumerable*** means "able to be counted". The reason it's a separate module is because other types of collections also include `Enumerable`. Like, for example, the `Hash` data type. It makes sense to keep our code DRY (Don't - Repeat - Yourself), and therefore they've separated like-functionality into a separate module that can be used over and over again in collection types.

When looking up documentation on arrays, you'll want to look at both the Array documention and the Enumerable documentation:

https://ruby-doc.org/core-2.4.1/Array.html
https://ruby-doc.org/core-2.4.1/Enumerable.html

## Creating An Array

Use square brackets `[]` to create an array.

For example, here we create an empty array and store it in a new variable `my_array`.

```ruby
my_array = []
```

You can include values as you create an array too:

```ruby
breakfast = ['pancakes', 'bacon', 'eggs']
```

## Adding To An Array

Use the Ruby ***'shovel operator'*** `<<` to ***push*** (*add*) an object onto an array:

```ruby
my_array << 'Ray'
my_array << 'Egon'
my_array << 'Peter'
my_array << 'Winston'
```

When an item is added to the array, it's assigned an ***index***.  An index is an `Integer` pointing to the value in the array. The index begins at `0`, and goes up by one for each item added. New items *pushed* onto the array are added to the end of the array.

## Removing From An Array

### `.pop`

To remove the last item from an array, use `pop`.

```ruby
irb > my_array << 'Ray'
irb > my_array << 'Egon'
irb > my_array << 'Peter'
irb > my_array << 'Winston'
irb > my_array << 'Dana'
irb > my_array
=> ["Ray", "Egon", "Peter", "Winston", "Dana"]
irb > my_array.pop
=> "Dana"
irb > my_array
=> ["Ray", "Egon", "Peter", "Winston"]
```

`push`: adds an item to the end of the array
`pop`: removes the last item of the array

Ruby arrays follow the computer science convention [LIFO](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)) (last in, first out).

![](https://upload.wikimedia.org/wikipedia/commons/b/b4/Lifo_stack.png)

### `.delete`

There are many ways to remove items from arrays. If you know the object you want to remove from your array, you can use `delete`:

```ruby
irb > my_array = ['Ray', 'Egon', 'Peter', 'Winston']
=> ["Ray", "Egon", "Winston", "Peter"]
irb > my_array.delete('Winston')
=> "Winston"
irb > my_array
=> ["Ray", "Egon", "Peter"]
```

### `.delete_at`

You can use `delete_at` if you know the index:

```ruby
irb > my_array = ['Ray', 'Egon', 'Peter', 'Winston']
=> ["Ray", "Egon", "Winston", "Peter"]
irb > my_array.delete_at(2)
=> "Winston"
irb > my_array
=> ["Ray", "Egon", "Peter"]
```

### `.shift`

And if it's the first item that needs to be removed, then use `shift`:

```ruby
irb > my_array = ['Ray', 'Egon', 'Peter', 'Winston']
=> ["Ray", "Egon", "Peter", "Winston"]
irb > my_array.shift
=> "Ray"
irb > my_array
=> ["Egon", "Peter", "Winston"]
```

### Index of values can change

When you remove a value from an array, the index of all the items after the removed item decreases by one.

```ruby
irb > foods = ['Potato Bread', 'French Fries', 'Potato Eyes', 'Potato Pizza', 'Mashed Potatoes']

# index:  0               1             2                3                4
=> ["Potato Bread", "French Fries", "Potato Eyes", "Potato Pizza", "Mashed Potatoes"]

irb > eat = foods.delete_at(2)
=> "Potato Eyes"

irb > foods

# index:  0               1             2                3
=> ["Potato Bread", "French Fries", "Potato Pizza", "Mashed Potatoes"]
```

## irb Tangent

irb reports back the return value of your last command. It denotes this using a ***hash rocket***, the `=>` sign. Thus if you type `my_array` (the name of your variable), irb will show you the contents of that variable:

```ruby
irb > my_array
=> ["Ray", "Egon", "Peter", "Winston"]
```

`puts` is a built-in Ruby method for outputing to he screen. When `puts` receives an array, it splits the array onto separate lines and outputs each line:

```ruby
irb > puts my_array
Ray
Egon
Peter
Winston
=> nil
```

Notice that the return value of `puts` is `nil`. Even though it displays output to the screen, `puts` always returns `nil`.

And now back to our regularly scheduled lesson ...

## Accessing Values

Array values can be accessed using their ***index***.

The first value in the array is accessed with the `Integer` `0`.
The next value is accessed with the `Integer` `1`.
The next value is accessed with the `Integer` `2`.
The next value is accessed with the `Integer` `3`.
and so on ...

To access a value, type the variable name your array is stored in, and then put square brackets `[]` directly beside the local variable name with the index you'd like to access.

For example:

```ruby
my_array[0] # returns "Ray"
my_array[2] # returns "Peter"
```

We can display the contents of an array with `puts`:

```ruby
puts my_array
```

`puts` displays each item in the array on a separate line.

We can access items starting from the end of the array and work backwards by using a negative index:

```ruby
my_array = ['Ray', 'Egon', 'Peter', 'Winston']
my_array[-1] # accesses 'Winston', the last item
my_array[-2] # accesses 'Peter', the second last item
```

## Modifying Values

Change the value of an array by accessing its index and using the `=` assignment operator:

```ruby
irb > words = ['The', 'quick', 'brown', 'fox']
=> ["The", "quick", "brown", "fox"]
irb > words[2] = 'purple'
=> "purple"
irb > words
=> ["The", "quick", "purple", "fox"]
```

When we add an item to an array, the return value is the array with the item added:

```ruby
irb > my_array
=> ["Ray", "Egon", "Peter", "Winston"]
irb > my_array << 'Dana'
=> ["Ray", "Egon", "Peter", "Winston", "Dana"]
```

## Any Object

Remember our array definition:

> Arrays are ordered, integer-indexed collections of ***any object***.

That means we can store *any object* in Ruby in an array.

```ruby
nums = [1, 2, 3]
prices = [2.99, 3.88, 4.77]
words = ['shoe', 'banana', 'the pope']
```

We can even mix object types:

```ruby
random_stuff = [2, 'the pope', :my_symbol]

=> [2, "the pope", :my_symbol]
```

Even though it's possible to add objects of different types in an array, it's more common to store objects of the same type in an array.

## Nested Arrays

We can store arrays inside of arrays:

```ruby
nums = [1, 2, 3]
prices = [2.99, 3.88, 4.77]
words = ['shoe', 'banana', 'the pope']
my_arrays = [nums, prices, words]
=> [[1, 2, 3], [2.99, 3.88, 4.77], ["shoe", "banana", "the pope"]]
```

Notice the square brackets on the outside of `my_arrays`. This denotes that my_arrays is an array. And then notice the square brackets around each array inside the greater array. This is called a ***nested array***.

## Class Exercise: Array Party Exchange

### Step #1: Create Your Array Of Items

Create an array of things you like. Include at least five items. For example, if you like ice cream, you could create the following array:

```ruby
flavours = ['Chocolate', 'Strawberry', 'Vanilla', 'Rocky Road', 'Green Tea']
```

### Step #2: Exchange Items With Classmate

Find a classmate and exchange items in your arrays.

When you give your classmate an item, ensure you remove that item from your array, and add the item your classmate is giving to you. Use the shovel operator `<<` to add your new item and either `pop`, `shift`, `delete`, or `delete_at` to remove an item.

Exchange a few times so that you end up with an array that's quite different from your original array.

### Step #4: Change The Value Of An Item

Change the value of one of your items to something else by using an equals `=` assignment operator.

### Step #5: Do Things With Your Array

Once you have items in an array, there's tons of functionality available. Try these out:

```ruby
your_array.sort
your_array.reverse
your_array.join(', ')
your_array.sample # try this one a few times

# try these: is there a difference?
your_array.size
your_array.count
your_array.length
```

Look at the [array documentation](https://ruby-doc.org/core-2.4.1/Array.html) and experiment with some of the other methods.
<br>
---

# Hashes

## Definition

> A Hash is a collection of unique keys and their values.

## Documentation

https://ruby-doc.org/core-2.4.1/Hash.html

Notice that Hashes include `Enumerable`, so you'll need to consult that [documentation](https://ruby-doc.org/core-2.4.1/Enumerable.html) too.

## Creating Hashes

Use curly braces `{}` to create hash.

For example, here we create an empty hash and store it in a new local variable `my_hash`.

```ruby
my_hash = {}
```

Here's how to create a hash with values:

```ruby
sean = { :nose => 'big', :eyes => 'brown', :age => 21 }
```

The `=>` is called a ***hash rocket*** as it's commonly used for create hashes and looks like a rocket.

Each item in a hash must have both a `key` and a `value`. In the example above:

`:nose` is the key, `'big'` is the value
`:eyes` is the key, `'brown'` is the value
`:age` is the key, `21` is the value.

Newer versions of Ruby support a more elegant syntax for creating hashes:

```ruby
sean = { nose: 'big', eyes: 'brown', age: 21 }
```

This example is identical to the first example. Even though the `nose` symbol is created with a `:` on the right side instead of the left side. When you read it back in irb, `nose` will be a symbol with the `:` on the left sie:

```ruby
irb > sean = { nose: 'big', eyes: 'brown', age: 21 }
=> {:nose=>"big", :eyes=>"brown", :age=>21}
```

The newer `:` on the right side makes creating a hash in Ruby very similar to creating an object in JavaScript. In JavaScript, ***objects*** are similar to ***hashes*** in Ruby.

Symbols are often used as keys for a hash, but any Ruby object can be a key. For example, here's a similar method assignment using strings instead of symbols:

```ruby
sean = { 'nose' => 'big', 'eyes' => 'brown', 'age' => 21 }
```

See how I used hash rockets for the assignments in the above example: if you aren't using symbols as keys, hash rockets must be used. If you are using symbols as keys, the best practice is to use a right-sided `:` for assignment.


## Adding To A Hash

To add a new key / value pair to an existing hash, access the hash using the variable name, and use `[]` along with an `=` to assign the value to the key:

```ruby
irb > sean = { nose: 'big', eyes: 'brown', age: 21 }
irb > sean[:hair] = 'nonexistent'
```

## Accessing Values

To obtain the value of a key, use `[]`:

```ruby
irb > sean = { nose: 'big', eyes: 'brown', age: 21 }
irb > sean[:eyes]
=> "brown"
```

If you create your hash with strings instead of symbols, you'll need to access the values using the strings:

```ruby
irb > sean = { 'nose' => 'big', 'eyes' => 'brown', 'age' => 21 }
=> {"nose"=>"big", "eyes"=>"brown", "age"=>21}
irb > sean['nose']
=> "big"
irb > sean[:nose]
=> nil
```

There is no `:nose` key in the above hash, so irb reports back `nil` as the value.

## Modifying Values

Values can be overwritten using the same syntax as adding a new key / value pair:

```ruby
irb > sean = { nose: 'big', eyes: 'brown', age: 21, hair: 'nonexistent' }
=> {:nose=>"big", :eyes=>"brown", :age=>21, :hair=>"nonexistent"}

irb > sean[:hair] = 'long, brown mane'
=> "long, brown mane"

irb > sean
=> {:nose=>"big", :eyes=>"brown", :age=>21, :hair=>"long, brown mane"}
```

## Removing Values

You can set a value to `nil`, which in Ruby is a valid value that means **nothing**.

```ruby
sean[:hair] = nil
```

But you'll still have the key / value pair in your hash:

```ruby
irb > sean
=> {:nose=>"big", :eyes=>"brown", :age=>21, :hair=>nil}
```

To remove the key / value from the hash, use `delete`:

```ruby
sean.delete(:hair)
```

## Nested Hashes

It's common to nest hashes within hashes:

```ruby
sean =  { name: 'Sean',  role: 'Instructor', features: { hair: 'wonderful', eyes: 'brown', age: 21, nose: 'big'     } }
sasha = { name: 'Sasha', role: 'Instructor', features: { hair: 'curly',     eyes: 'brown', age: 15, nose: 'nice'    } }
alice = { name: 'Alice', role: 'Student',    features: { hair: 'red',       eyes: 'blue',  age: 71, nose: 'massive' } }
bob =   { name: 'Bob',   role: 'Student',    features: { hair: 'blonde',    eyes: 'green', age: 11, nose: 'lovely'  } }

puts "#{alice[:name]} is the student and she has #{alice[:features][:hair]} hair."
```

Notice we needed to access to Alice's hair colour by using two sets of square brackets: `alice[:features][:hair]`.

`alice[:features]` returns the nested hash: `{ hair: 'red',       eyes: 'blue',  age: 71, nose: 'massive' }`

We then take that returned hash and add `[:hair]` to access he value under that key in the returned hash:

`alice[:features][:hair]` which ultimately returns `"red"`.


<br>

---

# Hashes vs. Arrays

## Array Use Case

Arrays are used when you have like objects.

## Hash Use Case

Hashes are used when you have values you want to associate to the same object.

## When to choose one or the other?

Both are used extensively with each other. You've already been exposed to these data structures in week 1: HTML and CSS.

For example, let's say we had this html document:

```html
<html>
<head>
  <title>Kitty Catty Ipsum</title>
  <style type='text/css'>

    body {
      background: yellow;
    }

    h1 {
      color: tomato;
      font: 25px;
    }

    .inverted {
      color: white;
      background: black;
    }

    .normal {
      color: black;
      background: white;
    }

    .big {
      font: 20px;
    }

  </style>
</head>
<body>
  <h1>Cat Ipsum</h1>
  <p id='leading' class='inverted big'>
    Hide head under blanket so no one can see. Proudly present butt to human. Then cats take over the world kitty loves pigs.
  <p>
  <p id='main' class='normal'>
    Rub face on everything. Bleghbleghvomit my furball really tie the room together. Hunt anything that moves rub whiskers on bare skin act innocent meow to be let out and sleep on keyboard eat from dog's food. Give me attention or face the wrath of my claws refuse to drink water except out of someone's glass, or then cats take over the world, and sit in box sleep on keyboard.
  </p>
</body>
</html>
```

You can imagine a web browser parsing it like so when it's trying to figure out how to display the document on your screen:

```ruby
styles = [
  'body'      => { background: 'yellow' },
  'h1'        => { color: 'tomato', font: '25px' },
  '.inverted' => { color: 'white', background: 'black' },
  '.normal'   => { color: 'black', background: 'white' },
  '.big'      => { font: '20px' }
]

page = [
  html: { parent: :root },
  head: { parent: :html },
  title: { parent: :head, content: 'Kitty Catty Ipsum' },
  body: [
    { h1: { content: 'Cat Ipsum' } },
    { p: { content: 'Hide head under blanket so no one can see. Proudly present butt to human. Then cats take over the world kitty loves pigs.',
           attributes: [id: 'leading', class: ['inverted', 'big']] } }
  ]
]
```

You can see in the above example we need to use both hashes and arrays together.

<br>

---

# Iteration

## Iterating Through Arrays

### `.each`

`.each` is the most common way to iterate through a collection. It executes a code block once for each item in the array.

Here is the syntax with an example:

```ruby
bears = ['Cheer', 'Funshine', 'Love-a-lot', 'Grumpy']

bears.each do |bear|
  puts "#{bear} Bear battles Professor Coldheart"
end

puts 'Professor Coldheart flees to the Land Without Feelings.'
```

It will output:

```
Cheer Bear battles Professor Coldheart
Funshine Bear battles Professor Coldheart
Love-a-lot Bear battles Professor Coldheart
Grumpy Bear battles Professor Coldheart
Professor Coldheart flees to the Land Without Feelings.
```

By default, Ruby code is executed from top to bottom, unless a flow control mechanism is introduced. In our case, we have introduced a loop, so the first line is executed, then the loop is executed four times (once for `each` item in the array), and then the final line is executed.

Let's take apart the example:

```ruby
bears = ['Cheer', 'Funshine', 'Love-a-lot', 'Grumpy']
```

Here we setup a local variable called `bears`. In this variable we store an array that contains 4 strings: *Cheer*, *Funshine*, *Love-a-lot* and *Grumpy*. Notice that our variable name `bears` has an `s` on the end of it. It's common to pluralize collections, and when you move onto rails, pluralization has significant meaning.

```ruby
bears.each do |bear|
```

This is the setup for our loop. We are calling the `each` method on `bears` and we are passing in a code block as our argument.

We have also setup `bear` as a local variable that will only have scope within the code block. Notice `bear` is singular, as it will represent a single `bear` each time the code block is executed.

The local variable `bear` could have been any valid ruby local variable name, but it's important to choose meaningful names for variables, so we chose bear.

For example, we could have chosen `x` as the local variable name:

```ruby
bears.each do |x|
  puts "#{x} Bear battles Professor Coldheart"
end
```

The above example would be processed exactly like our original code block, but is more difficult to understand as `x` has less meaning.

One of the most important goals in programming is make your code ***easy to reason about***. Once you start developing bigger programs, it can be difficult to follow code that doesn't use thoughtful variable names. Let's put `bear` back in as our block scoped variable name:

```ruby
bears.each do |bear|
  puts "#{bear} Bear battles Professor Coldheart"
end
```

Between the `do` and the `end` is the code block. It will be executed once for *each* item in the array.

It begins at the `do`, sets up the current array item in the local variable `bear`, and then when it reaches the word `end`, it goes back to the word `do`. It continues this process until it's iterated through every item in the array.

```ruby
  puts "#{bear} Bear battles Professor Coldheart"
```

This line is the inside of the code block. The first time it's executed, the local variable `bear` will equal 'Cheer' and it will output:

```
Cheer Bear battles Professor Coldheart
```

The second time it's executed, `bear` will equal `Funshine` and it will output:

```
Funshine Bear battles Professor Coldheart
```

The third time it's executed, `bear` will equal `Love-a-lot` and it will output:

```
Love-a-lot Bear battles Professor Coldheart
```

The fourth time it's executed, `bear` will equal `Grumpy` and it will output:

```
Grumpy Bear battles Professor Coldheart
```

Let's take one more look at this loop:

```ruby
bears.each do |bear|
  puts "#{bear} Bear battles Professor Coldheart"
end
```

After it's finished processing the loop, the local variable `bear` disappears and is no longer set. It only held a value in the `do...end` code block. If we added the line `puts bear` after the loop:

```ruby
bears.each do |bear|
  puts "#{bear} Bear battles Professor Coldheart"
end

puts bear
```

... Ruby would complain with an `undefined local variable or method 'bear'` error.


The final line of code that's executed:

```ruby
puts 'Professor Coldheart flees to the Land Without Feelings.'
```

... is outside of the loop, so it's processed only once. It outputs:

```
Professor Coldheart flees to the Land Without Feelings.
```

Let's take one last look at the entire program and output:

```ruby
bears = ['Cheer', 'Funshine', 'Love-a-lot', 'Grumpy']

bears.each do |bear|
  puts "#{bear} Bear battles Professor Coldheart"
end

puts 'Professor Coldheart flees to the Land Without Feelings.'
```

Output:

```
Cheer Bear battles Professor Coldheart
Funshine Bear battles Professor Coldheart
Love-a-lot Bear battles Professor Coldheart
Grumpy Bear battles Professor Coldheart
Professor Coldheart flees to the Land Without Feelings.
```

![](http://vignette1.wikia.nocookie.net/carebears/images/7/72/Professor_Coldheart_-_Care_Bears.jpg)

Let's try another `.each` loop.

```ruby
numbers = [1, 2, 3, 4, 5]

numbers.each do |number|
  puts "#{number} * 5 is equal to #{number * 5}"
end
```

Output:

```
1 * 5 is equal to 5
2 * 5 is equal to 10
3 * 5 is equal to 15
4 * 5 is equal to 20
5 * 5 is equal to 25
```

Another way to write this is:

```ruby
[1, 2, 3, 4, 5].each do |number|
  puts "#{number} * 5 is equal to #{number * 5}"
end
```

In the example above, I never set up the local variable `numbers`. Instead I just set up an array and immediately called `.each` on it.

### `do...end` vs `{ }`

You'll often come across examples that use `{ }` instead of `do...end`. The open curly `{` is the `do` and the close curly `}` is the `end`.

Ruby coders usually use curlys for simpler iteration loops that only contain one line of code in their code block. For example, the loop above could be written like this:

```ruby
[1, 2, 3, 4, 5].each { |number| puts "#{number} * 5 is equal to #{number * 5}" }
```

Notice the above example is the same as the earlier `do...end` block, except that everything is on one line, and `do` has been substituted with `{`, and `end` with `}`.

You may even find curlys used on multiple lines:

```ruby
[1, 2, 3, 4, 5].each { |number|
  puts "#{number} * 5 is equal to #{number * 5}"
}
```

This is also valid Ruby code, but is not common practice.

As you're just starting out, it's recommended that you always use `do...end` over multiple lines until you firmly grasp iteration. I only bring up the curlys as you will find examples like this when you're looking up the documentation.

### `.map`

`.map` transforms each item in an array. It's the second most common way of iterating over an array.

Let's say we wanted to create an HTML page for the Care Bear battle, and we want each attack to be a list item (`<li>` tag):

```ruby
bears = ['Cheer', 'Funshine', 'Love-a-lot', 'Grumpy']

list_item_bears = bears.map do |bear|
  "  <li>#{bear} Bear battles Professor Coldheart</li>"
end

puts '<ul>'
puts list_item_bears
puts '</ul>'
```

When we run this progarm, we'll see the bears all set up nicely in a list that we can copy to our HTML page:

```
<ul>
  <li>Cheer Bear battles Professor Coldheart</li>
  <li>Funshine Bear battles Professor Coldheart</li>
  <li>Love-a-lot Bear battles Professor Coldheart</li>
  <li>Grumpy Bear battles Professor Coldheart</li>
</ul>
```

Map has transformed each bear in the array to a sentence enclosed in `<li>` tags.

Notice that we put this into the `list_item_bears` variable as well, and then used that variable afterwords. This is because `.map` is a method that returns a value, and we are putting that return value into a variable.

`.each` from our original example also returns a value -- but that value is the array that `.each` was called on, so it's uncommon to assign the results of `.each` to a variable.

Note that our original array hasn't been touched. If we check the value of our original array:

```ruby
irb > bears
```

We'd get:

```ruby
=> ["Cheer", "Funshine", "Love-a-lot", "Grumpy"]
```

Don't worry if you don't fully grasp `.map` just yet: you may not even fully understand it by the end of this course. These are complex concepts.

### `.map!`

`.map!` is the same as `.map`, except it changes the array it's called on. In computer science, changing the value of something is called ***mutation***.

Let's try it out with the previous example:

```ruby
bears = ['Cheer', 'Funshine', 'Love-a-lot', 'Grumpy']

bears.map! do |bear|
  "  <li>#{bear} Bear battles Professor Coldheart</li>"
end

puts '<ul>'
puts bears
puts '</ul>'
```

This outputs:

```
<ul>
  <li>Cheer Bear battles Professor Coldheart</li>
  <li>Funshine Bear battles Professor Coldheart</li>
  <li>Love-a-lot Bear battles Professor Coldheart</li>
  <li>Grumpy Bear battles Professor Coldheart</li>
</ul>
```

It's the exact same output as before, except this time I didn't need to assign the return result of map to a variable. This is because `bears` was mutated by the `.map!` method.

If we look at `bears` now, we can see they have been changed:

```ruby
irb > bears
=> [
    "  <li>Cheer Bear battles Professor Coldheart</li>",
    "  <li>Funshine Bear battles Professor Coldheart</li>",
    "  <li>Love-a-lot Bear battles Professor Coldheart</li>",
    "  <li>Grumpy Bear battles Professor Coldheart</li>"
  ]
```

<small>(Note: I separated the output onto separate lines for easy reading.)</small>

The original array we set up with:

```ruby
bears = ['Cheer', 'Funshine', 'Love-a-lot', 'Grumpy']
```

... no longer exists.

### `!` methods

In Ruby, it's common to put a `!` after methods that mutate data. That's why the mutating `.map!` version has a `!` at the end of it it.

Sometimes a `!` is called a '***bang***', as it's easier to say than '***exclamation mark***'.

Not all mutating methods have a `!` though. For example:

```ruby
bears = ['Cheer', 'Funshine', 'Love-a-lot', 'Grumpy']
puts 'Your bears:'
puts bears
puts

bears.pop
puts 'Your bears after the `pop`:'
puts bears
```

Output:

```
Your bears:
Cheer
Funshine
Love-a-lot
Grumpy

Your bears after the `pop`:
Cheer
Funshine
Love-a-lot
```

*Oh no! Grumpy Bear has disappeared!*

This is because `pop` mutates even though pop doesn't have a `!` bang. There's some inconsistancy with the use of `!` throughout the Ruby language, but a `!` at the end of a method is a sign it's a more destructive version of the bang-less version of the method.

### More iterative methods

There are many iterative methods, each serving a useful purpose and each used in a different way:

#### `.reduce` / combines elements

```ruby
sum = [10, 20, 30, 40].reduce(0) do |number, total|
  total = total + number
end
puts sum # outputs 100
```

#### `.sort_by` / sorts elements

```ruby
last_names = ['Cox', 'Ambalakarar', 'Khan',  'Chang']

names_sorted_by_length = last_names.sort_by do |name|
  name.length
end

names_sorted_by_length # ["Cox", "Khan", "Chang", "Ambalakarar"]
```

#### `.select` / selects elements that meet a criteria

```ruby
last_names = ['Cox', 'Ambalakarar', 'Khan',  'Chang']

names_that_start_with_c = last_names.select do |name|
  name.chars.first == 'C'
end

names_that_start_with_c # ["Cox", "Chang"]
```

Checkout https://ruby-doc.org/core-2.4.1/Enumerable.html for even more iterative methods


## Iterating Through Hashes

As hash contains both a `key` a `value`, we have to specify variables for both of those when we iterate through a hash.

For example, let's say we'd like to describe in more detail how the Care Bears battle goes:

```ruby
bears = {
  'Cheer'      => 'fires an uzi at',
  'Funshine'   => 'jabs forward with a sword impaling',
  'Love-a-lot' => 'throws a grenade at',
  'Grumpy'     => 'shoots a poison tipped arrow at'
}

bears.each do |bear, action|
  puts "#{bear} Bear #{action} Professor Coldheart"
end

puts
puts 'Professor Coldheart dies in a mound of flesh and bones as'

bears.each do |bear, action|
  print "#{bear} Bear, "
end

puts
puts 'all let out blood thirsty roars!'
```

Output:

```
Cheer Bear fires an uzi at Professor Coldheart
Funshine Bear jabs forward with a sword impaling Professor Coldheart
Love-a-lot Bear throws a grenade at Professor Coldheart
Grumpy Bear shoots a poison tipped arrow at Professor Coldheart

Professor Coldheart dies in a mound of flesh and bones as
Cheer Bear, Funshine Bear, Love-a-lot Bear, Grumpy Bear,
all let out blood thirsty roars!
```

In this example we iterate through our hash twice. During each iteration, we setup the `key` to be stored in the variable `bear` and the `value` to be stored in the variable `action`.

Notice that during our second iteration of the hash:

```ruby
bears.each do |bear, action|
  print "#{bear} Bear, "
end
```

We set up a local variable called `action` even though we never used `action` in the `do...end` block. This is because hashes are always `key - value` pairs, and you need to specify both regardless when iterating.

One technique programmers use when they're forced to set a variable name they don't need is to use an underscore at the start of that variable. So for example, we could put:

```ruby
bears.each do |bear, _action|
  print "#{bear} Bear, "
end
```

This is like saying:
> Yeah, I don't really want the `_action` variable, but Ruby is making me set it just so I can iterate through the hash. Eesh!

![](https://s-media-cache-ak0.pinimg.com/originals/28/44/13/284413cc8247c884e3ad04342fc7fc00.jpg)

## Other Enumerable Methods

You can use the other enumerable methods on hashes as well.

In our Care Bear story, there's only so much room in the jeep and we want to bring only the most powerful Care Bears. Let's ditch the Bears that do little damage.

We can use `.select` to extract the bears that do more than 50 damage:

```ruby
bears = {
  'Cheer'      => { action: 'fires an uzi at', damage: 90 },
  'Funshine'   => { action: 'jabs forward with a sword impaling', damage: 10 },
  'Love-a-lot' => { action: 'throws a grenade at', damage: 80 },
  'Grumpy'     => { action: 'shoots a poison tipped arrow at', damage: 20 }
}

useful_bears = bears.select do |_bear, attributes|
  attributes[:damage] > 50
end

puts "Let's bring "
useful_bears.each do |bear, _attributes|
  puts bear
end
puts 'to the battle as they do the most damage.'
```

Output:

```
Let's bring
Cheer
Love-a-lot
to the battle as they do the most damage.
```

Notice how the first time we iterate through the hash:

```ruby
useful_bears = bears.select do |bear, attributes|
  attributes[:damage] > 50
end
```

... we only use `attributes`, the `value` of the ***key - value*** pair.

And the second time we iterate through the hash:

```ruby
useful_bears.each do |bear, attributes|
  puts bear
end
```

... we only use `bear`, the `key` of the ***key - value*** pair.


<br>

---

# Wrap-up

We've covered a lot of material here. Don't worry if you didn't take it all in. It can take some time to fully understand these concepts.

What's important to take away for today is:

- when to use an array
- when to use an hash
- how to identify an array (with square brackets `[]`)
- how to identify a hash (with curly braces `{}`)
- that both arrays and hashes are collections of other objects
- that there are useful methods you can use on both of these
- how to access the documentation to perform all of the above

---

# Further Resources

**Ruby Array Class Documentation**
https://ruby-doc.org/core-2.4.1/Array.html

**Ruby Hash Class Documentation**
https://ruby-doc.org/core-2.4.1/Hash.html

**Ruby Enumerable Module Documentation**
https://ruby-doc.org/core-2.4.1/Enumerable.html
