#!/bin/sh

abspath="$(realpath "$(pwd)")"

if [ -f ./WAIVER ] || [ -f ./UNLICENSE ]; then
  echo "This project appears to already contain the UNLICENSE or the WAIVER."
  exit 1
fi

asurl="as url for the WAIVER and CONTRIBUTING.md. edit if needed."
if [ -d ./.git ] &&
  prj=$(git remote -v | awk '{ print $2 }' | sed 's/git@//g; s|:|/|g; s/\.git$//g; 1q') &&
  echo "Found git repo, using first remote <${prj}> ${asurl}"
then
  echo ""
else
  prj="$(basename "$abspath")" &&
  echo "Using directory name <${prj}> ${asurl}" &&
  echo "Note that having the official URL for the project is preferred."
  echo ""
fi

cat > WAIVER << EOF
# Copyright waiver for <${prj}>

I dedicate any and all copyright interest in this software to the
public domain. I make this dedication for the benefit of the public at
large and to the detriment of my heirs and successors. I intend this
dedication to be an overt act of relinquishment in perpetuity of all
present and future rights to this software under copyright law.

To the best of my knowledge and belief, my contributions are either
originally authored by me or are derived from prior works which I have
verified are also in the public domain and are not subject to claims
of copyright by other parties.

To the best of my knowledge and belief, no individual, business,
organization, government, or other entity has any copyright interest
in my contributions, and I affirm that I will not make contributions
that are otherwise encumbered.
EOF

cat > UNLICENSE << EOF
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
EOF

nontrivial="non-trivial contribution (more than 15 lines of code changed)"

cat >> CONTRIBUTING.md << EOF

# Unlicensing your contributions

This project is public domain. Any ${nontrivial}
should attach the disclaimer in the WAIVER file to their commit messages so that the intent to
release the code into the public domain is clear.

Make sure the waiver is in the COMMIT message, not just the pull request, so that the intent is
preserved even if the project is moved to a different git platform.

An even better way to sign your waiver is to \`gpg --no-version --armor --sign WAIVER\` and append
that to the AUTHORS file (create it if it doesn't exist)

If you're a company or your employer normally owns the code you write, you should attach a copyright
disclaimer signed by your company that releases any copyright interest, such as

\`\`\`
Some Company Inc. hereby disclaims all copyright interest in <${prj}>

signature of Bob Smith 5 June 2020
Bob Smith, President of Some Company
\`\`\`
EOF

cat >> pull_request_template.md << EOF
# Unlicensing your contributions
- [ ] If this is a ${nontrivial}, I will attach a contributor waiver as explained in
      [the contributor guidelines](../CONTRIBUTING.md) .
EOF
