module command

import time
import discordv as cord

enum Types {
	@type string
	is_bot bool
	id int
}

pub fn from_func(mut bot cord.Client, msg &cord.MessageCreate) ? {
	return bot.channel_message_send(msg.channel_id, content: "Content from a func.")
}

pub fn from_embed(mut bot cord.Client, msg &cord.MessageCreate) ? {

	return bot.channel_message_send(msg.channel_id, embed: cord.Embed{
		title: "Embed :D"
		description: "Hello " + msg.author.username
		fields: [
			cord.EmbedField{
				name: "Your ID"
				value: msg.author.id
				inline: false
			},
			cord.EmbedField{
				name: "Tag"
				value: msg.author.discriminator
				inline: false
			},
			cord.EmbedField{
				name: "Time now"
				value: time.utc().str()
				inline: false
			}
		]
		color: 0x7670be
	})
}
