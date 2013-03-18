# The Get Smart Cipher Kata

You work with Agent 86 and have been tasked to "computerize" his super secret cipher. This cipher is a bit more complex than Caesar's, and will be used by [read: no] Agents the world over.

The requirements for the cipher are laid out below in sections. Each section has a minimum list of test inputs/outputs to pass before moving on to the next section. 

## Requirement 1 - Consonants

Consonants will be replaced based upon the table below. 

<pre>
          +---+---+---+---+---+---+---+---+---+---+---+
  Letter  | b | c | d | f | g | h | j | k | l | m | n |
  Replace | r | f | p | o | a | t | v | l | q | i | h |
          +---+---+---+---+---+---+---+---+---+---+---+
  Letter  | p | q | r | s | t | v | w | x | y | z |   |
  Replace | j | m | k | d | b | e | x | u | g | y |   | 
          +---+---+---+---+---+---+---+---+---+---+---+
</pre>

### Tests

Encrypt tests

  <pre>
         +---+-----+
  Input  | c | try | 
  Output | f | bkg |
         +---+-----+
  </pre>

Decrypt tests

  <pre>
         +---+-----+
  Input  | f | bkg |
  Output | c | try |
         +---+-----+
  </pre>

## Requirement 2 - Multiple Consonants

Multiple consonants are denoted with a capital letter followed by a '?'.
When decrypting, replace the capital letter with two lowercase letters
and keep the '?' to denote that there may be more than 2 of the letter.

### Tests

Encrypt tests

<pre>
         +----+------+------+
  Input  | tt | vttt | vvtt |
  Output | B? | eB?  | E?B? | 
         +----+------+------+
</pre>

Decrypt tests

<pre>
         +-----+------+--------+
  Input  | B?  | eB?  | E?B?   |
  Output | tt? | vtt? | vv?tt? |
         +-----+------+--------+
</pre>

## Requirement 3 - Singular Vowels

Vowels are not translated one for one as consonants. Instead vowels are denoted by the consonants surrounding them. In the cipher a repeated letter where one is upper case and the other lower case, denotes that a vowel is next to the lower case letter.

For example the word "be" would be converted to "Rr".

Or "eb" would convert to "rR".
