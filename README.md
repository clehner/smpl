# smpl(1)

**smpl** is a command-line client for Simple bank accounts that uses
simple.com's unofficial API.

Use **smpl** to view your account balance, card status, transaction history,
and linked accounts.

## Installation

- Make sure you have `curl(1)`.
- Clone the repo and install smpl:
```
git clone https://github.com/clehner/smpl.git
cd smpl
make install
```

## Usage

**smpl** has a subcommand for each operation. For complete reference, check the
man page.

- List transactions: `smpl transactions`
  - in [ledger](http://ledger-cli.org/) format: `--format=ledger`
  - show all transactions: `--all`
  - show transactions as they are made: `--follow`
  - show transactions from the past N hours: `--since=N`

- Get account balance: `smpl balance`

- Get card status: `smpl card`

- Show linked accounts: `smpl linked-accounts`

- Get help about a command: `smpl help [command]`

- List linked accounts and their details: `smpl linked-accounts`

- Options:
  - show raw JSON: `--raw`
  - skip cached results: `--no-cache`
  - get more debug info: `--verbose`

### Authentication
By default, **smpl** will ask you for a username and password when you run a
command for which it needs you to log in. To make it quicker to log in, you
can set the environmental variables `SIMPLE_USERNAME` and `SIMPLE_PASSWORD`.
If you use a password manager such as [pass](http://www.passwordstore.org/),
you can skip `SIMPLE_PASSWORD` and set the password by setting
`SIMPLE_PASSCMD` to be a command that outputs the password, which **smpl**
will then run as needed.

## License
MIT
