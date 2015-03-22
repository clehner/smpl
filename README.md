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

### List transactions
```
smpl transactions
```

#### in [ledger](http://ledger-cli.org/) format:
```
smpl transactions --format=ledger
```

### Get account balance
```
smpl balance
```

### Get card status
```
smpl card
```

### Show linked accounts
```
smpl linked-accounts
```

### Get help about a command
```
smpl help [command]
```

### List linked accounts and their details
```
smpl linked-accounts
```

## License
MIT
