# Rose-pine Tap

## How do I install these formulae?

`brew install rose-pine/tap/<formula>`

Or `brew tap rose-pine/tap` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "rose-pine/tap"
brew "<formula>"
```

## Releasing

Edit the `VERSION` in the release script and run:

```sh
./release
```

This will set the formula version and update SHA's.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
