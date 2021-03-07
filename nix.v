module main

import modules as command
import os
import db
import discordv as cord

struct Config {
mut:
	token    string = os.getenv('BOT_TOKEN')
	prefix   string = '!'
	owner_id int
}

fn ready() {
	println('Bot is ready.')
}

fn cfg(bot Config) &Config {
	return &Config{
		token: bot.token
		prefix: bot.prefix
		owner_id: bot.owner_id
	}
}

// Executes the schema.sql file.
fn exec(path string) string {
	method := os.read_file(path) or { panic(err) }
	return unsafe { method }
}

fn set_prefix(self string) string {
	return self
}

// This is kinda messy discord.v don't have a commands framework &&
// still don't have no idea how to use this lang.

fn on_message(mut bot cord.Client, msg &cord.MessageCreate) {
	if msg.author.bot {
		return
	}
	mut pool := db.pgpool()
	prefix := pool.q_string('SELECT prefix FROM config') or { panic(err) }

	match msg.content {
		prefix + 'self' {
			bot.channel_message_send(msg.channel_id, content: set_prefix('!')) or { }
		}
		prefix + 'repo' {
			bot.channel_message_send(msg.channel_id, content: 'https://github.com/nxtlo/freya') or { }
		}
		prefix + 'try' {
			bot.channel_message_send(msg.channel_id, content: 'trihard') or { }
		}
		prefix + 'api' {
			command.run_api() or { }
		}
		prefix + 'func' {
			command.from_func(mut bot, msg) or { }
		}
		prefix + 'ui' {
			command.from_embed(mut bot, msg) or { }
		}
		else {}
	}
}

fn main() {
	conf := cfg(owner_id: 350750086357057537)

	if conf.token == '' {
		println('Exiting due to no token was provided.')
		return
	}
	mut bot := cord.new(token: conf.token) ?
	mut pool := db.pgpool()

	if os.exists('./lib/schema.sql') {
		pool.exec(exec('./lib/schema.sql')) ?
	}
	bot.on_message_create(on_message)
	ready()
	bot.open() ?
}
