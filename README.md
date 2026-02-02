# Titanic

Testing best practices for a Rust project with the github workflow.

## Guide

### Git hooks

#### Pre-commit hook

In order to save CI time and avoid the useless `rustfmt` commit, we can set a hook to run `cargo fmt --check` for us before commiting.

Activate the hook
```
$ cd .git/hooks && mv pre-commit.sample pre-commit
```

Now modify the file `pre-commit`. Delete everything and just put :
```bash
# This line indicate to exit at the first error
set -e 

cargo fmt --check
```

This hook will run the linter everytime before commiting change.

Alternatively we can use the `pre-push` hook. This allows atomic commiting and we just make sure that some basic checks (e.g linting) are all green before it hit the CI. It would avoid re-running the CI for a linter error.

## License

Do What The Fuck You Want To Public License

<a href="http://www.wtfpl.net/"><img
       src="http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-4.png"
       width="80" height="15" alt="WTFPL" /></a>