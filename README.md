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
  Output | tt* | vtt* | vv*tt* |
         +-----+------+--------+
</pre>

## Requirement 3 - Singular Vowels

Vowels are not translated one for one as consonants are. Instead vowels are denoted by the consonants surrounding them. In the cipher a repeated letter where one is upper case and the other lower case, denotes that a vowel is next to the lower case letter.

For example the word "be" would be converted to "Rr".

Or "eb" would convert to "rR".

### Tests

Encrypt tests

<pre>
         +----+------+----+
  Input  | be | polo | i  |
  Output | Rr | JjQq | [] |
         +----+------+----+
</pre>

Decrypt tests

<pre>
         +-----+------+------+
  Input  | Rr  | JjQq   | [] |
  Output | b[] | p[]l[] | [] |
         +-----+------+------+
</pre>

## Requirement 4 - multiple vowels

Multiple vowels are denoted using a ? on the opposite side of the vowel.
For example, "bee" would be converted to "?Rr"
or "ood" would be converted to "pP?"

### Tests

Encrypt tests

<pre>
         +----+------+-----+
  Input  | bee | ood | oo  |
  Output | ?Rr | ?pP | []? |
         +----+------+-----+
</pre>

Decrypt tests

<pre>
         +-----+---------+---+
  Input  | ?Rr  | ?pP  | []? |
  Output | b[]* | []*d | []* |
         +-----+---------+---+
</pre>

## Requirement 5 - Multiple vowels combined with multiple consonants

When dealing with multiple vowels and consonants, two ?'s are used instead of one to denote multiplicity.

For example "ooggle" would translate to "a?A?Qq" The ? between the g's denotes that there are multiple g's. The ? at the end denotes that there are multiple vowels before the g's.

### Tests

Encrypt tests

<pre>
         +----+------+------+
  Input  | ooggle | ffooodd |
  Output | a?A?Qq | ?O?oP?  |
         +----+------+------+
</pre>

Decrypt tests

<pre>
         +-----------+----------+
  Input  | a?A?Qq    | ?O?oP?   |
  Output | []*gg*l[] | ff*[]*d* |
         +-----------+----------+
</pre>

## Requirement 6 - Word match

Seeing []*gg*l[] is not very helpful when trying to understand the meaning of a secret agent message. Luckily we have a helpful list of English words. Your requirement is to replace unknown words with a list of at most 5 words which may be a match. 

[]'s need to be replaced with a vowel. 
e.g. the word "to" would be encrypted to "Bb" which would then be decrypted to "t[]" With word match, "t[]" should be replaced with (ti, to) as those are words defined in the word list. 

*'s denote repeating. When word matching only repeat up to 3 times. e.g. If you have tt*d, then only search for the word "ttd" and "tttd". 

If you have a repeating vowel, you will still need to search up to 3 characters, but in this case, each character could be a different vowel. e.g. The word "eagle" would decrypt to "[]*gl[]". With this combination you could end up with words: "eagle", "oogle", etc.
### Tests

Decrypt tests

<pre>
         +---------+-----------------------+
  Input  | Bb      | ?Rr                   |
  Output | (ti,to) | (baa,bee,bio,boa,boo) |
         +---------+-----------------------+
  Input  |
  Output |
         +---------+-----------------------+
</pre>
