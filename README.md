Introduction

HTML is an amazing tool for marking up documents, but it's not very fun for writing content.

Several years ago, John Gruber proposed the idea of Markdown. It's a style of text formatting that's less obtrusive than writing HTML, is easy to remember, and is highly readable even when not converted to HTML. Here's an example:

# My Life in Desserts

## Chapter 1: The Beginning

"You just *have* to try the cheesecake," he said. "Ever since it appeared in
**Food & Wine** this place has been packed every night."
A typical user writes a markdown document, but here your challenge is to write a markdown parser.

Markdown Parsers

There are markdown parsers available for just about every language you can imagine. In the Ruby world some of the best known are Redcarpet, Rdiscount, and RedCloth. For any production system, unless you really take Chisel to the next level, you're strongly encouraged to use RedCarpet.

But let's figure out how a parser is built.

Learning Goals / Areas of Focus

Practice breaking a program into logical components
Test components in isolation and in combination
Apply Enumerable techniques in a real context
Read text from and write text to files
Base Expectations

An Interaction Model

We're going to use Chisel from the command line, reading in Markdown files and writing out HTML. It'll go like this:

$ ruby ./lib/chisel.rb my_input.markdown my_output.html
Converted my_input.markdown (6 lines) to my_output.html (8 lines)
Where my_input.markdown is a file like this:

# My Life in Desserts

## Chapter 1: The Beginning

"You just *have* to try the cheesecake," he said. "Ever since it appeared in
**Food & Wine** this place has been packed every night."
And the resulting my_output.html would contain the following:

<h1>My Life in Desserts</h1>

<h2>Chapter 1: The Beginning</h2>

<p>
  "You just <em>have</em> to try the cheesecake," he said. "Ever since it appeared in
  <strong>Food &amp; Wine</strong> this place has been packed every night."
</p>
Got it?

Expected Functionality

Parsing Markdown is a good application of spiraling design. As such, your expected functionality is broken down into levels. But all of these levels should be completed in order to earn full marks.

Level 1 - Text Basics

A chunk of text is defined as one or more lines of content which does not contain any blank lines. For example, this is one chunk of text:

This is the first line of the paragraph.
This is the second line of the same paragraph.
While these are two chunks of text:

This is the first line of the first paragraph.

This is the first line of the second paragraph.
Build up your Chisel so it supports:

A chunk of text starting with #, ##, ###, ####, or ##### is turned into an HTML header (<h1>, <h2>) with the header level corresponding to the number of # symbols
A chunk of text not starting with # is turned into a paragraph
Level 2 - Formatting

With Level 1 completed, move on to Level 2:

Within either a header or a paragraph, any word or words wrapped in * should be enclosed in <em> tags
Within either a header or a paragraph, any word or words wrapped in ** should be enclosed in <strong> tags
Make sure to consider scenarios like this: My *emphasized and **stronged** text* is awesome.

Level 3 - Lists

Often in writing we want to create unordered (bullet) or ordered (numbered) lists. Build support for unordered lists like this:

My favorite cuisines are:

* Sushi
* Barbeque
* Mexican
Which should output:

<p>
  My favorite cuisines are:
</p>

<ul>
  <li>Sushi</li>
  <li>Barbeque</li>
  <li>Mexican</li>
</ul>
Then build support for ordered lists which use numbers for the markers. Though, confusingly, the numbers themselves don't matter. Some authors use 1. to mark every list element and let the HTML renderer (aka browser) figure things out:

My favorite cuisines are:

1. Sushi
2. Barbeque
3. Mexican
Which is turned into:

<p>
  My favorite cuisines are:
</p>

<ol>
  <li>Sushi</li>
  <li>Barbeque</li>
  <li>Mexican</li>
</ol>
Level 4 - Links

At this point you're familiar with the basics of how Markdown works. Go straight to the source to see how HTML links should work. You do not need to implement the "Reference-Style Links", just the normal inline ones.

Extensions

If you finish all the base expectations, consider implementing two of these extensions:

Images

Add support for images, both with and without the optional title attribute. Don't implement the Reference-Style Links. See the specification

Blocks & Blockquotes

Add support for both Blockquotes and Code Blocks.

Reference-Style Links

Revisit the documentation about Links and build up support for the reference-style links it describes.

Reverse Chisel

Can you implement a reverser which takes in HTML and outputs Markdown?

This extension is quite hard, so it counts double.