# Header H1
## Header H2
### Header H3

*em* _em_

**strong** __strong__

Inline `code`.

Inline ``code that includes a backtick ` here``.
Also note the spaces in `` `foo` ``.

[this is a link](http://example.com/ "Optional Title").
[this is a path to a local resource](/about)
Auto-linked URL: <http://example.com/>
Auto-linked email address: <address@example.com>
[an example][1] reference-style link
[Google][] implicit reference-style link

Later:

[1]: http://example.com  "Optional Title Here"
[Google] http://www.google.com

![Alt text](/path/to/img.jpg "Optional Title")
![Alt text][1]

Later:

[1]: url/to/image  "Optional title attribute"

> Blockquoting
> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
> tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,

Unordered Lists can use asterisks (*), pluses (+), or hyphens (-):

* Item 1
* Item 2
* Item 3

Ordered lists:

1. Item 1
2. Item 2
3. Item 3

Paragraphs in a list item must be indented by 4 spaces:

1.  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo

    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Code blocks must be indented by 4 spaces:

    class C
    end

Code blocks with syntax highlighting in GitHub

```javascript
function fancyAlert(arg) {
  if(arg) {
    $.facebox({div:'#foo'})
  }
}
```

Horizontal rules are produced by placing three or more hyphens, asterisks, or
underscores on a line by themselves. Spaces are ignored:

                                    . . .

Inline HTML

This is a regular paragraph.

<table>
    <tr>
        <td>Foo</td>
    </tr>
</table>

This is another regular paragraph.

Markdown provides backslash escapes for the following characters:

    \`*_{[(#+-.!
