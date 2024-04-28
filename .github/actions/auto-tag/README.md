# auto-tag

A composite action to create a tag.

The action doesn't make any assumptions about how to create the tag, it needs to be supplied.

All inputs are required:

| input | description
|-------|-----------------------------------|
| tag   | The tag to create                 |
| pat   | The personal access token (PAT)   |
| user  | The user (who's PAT we are using) |

Example:

```yaml
jobs:
  auto-tag:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
      with:
        fetch_depth: 0
    - name: logic to determine your next tag
      id: tag
      run: echo "version=something" >> $GITHUB_OUTPUT
    - uses: ./.github/actions/auto-tag
      with:
        tag: ${{ steps.tag.outputs.version }}
        pat: ${{ secrets.PAT }}
        user: till
```
