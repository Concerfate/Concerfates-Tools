import discord
from discord.ext import commands

# Your bot token
TOKEN = 'Enter your bots token'

# Intent setup
intents = discord.Intents.default()
intents.guilds = True
intents.members = True
intents.message_content = True  # Required for reading message content

# Create bot instance
bot = commands.Bot(command_prefix='!', intents=intents)

# Function to delete all channels in a guild
async def delete_channels(guild):
    for channel in guild.channels:
        try:
            await channel.delete()
            print(f"Deleted channel: {channel.name}")
        except Exception as e:
            print(f"Failed to delete channel {channel.name}: {e}")

# Function to kick all members in a guild
async def kick_members(guild):
    for member in guild.members:
        if not member.guild_permissions.administrator:  # Don't kick admins
            try:
                await member.kick(reason="Kicked by MultiTool")
                print(f"Kicked member: {member.name}")
            except Exception as e:
                print(f"Failed to kick member {member.name}: {e}")

# On ready event
@bot.event
async def on_ready():
    print(f'Logged in as {bot.user.name}')

    # List available servers
    print("Available servers:")
    for idx, guild in enumerate(bot.guilds):
        print(f"{idx + 1}: {guild.name}")

    # Ask user for selection
    while True:
        try:
            server_number = int(input("Select a server by number: ")) - 1
            if 0 <= server_number < len(bot.guilds):
                selected_guild = bot.guilds[server_number]
                break
            else:
                print("Invalid selection, please try again.")
        except ValueError:
            print("Please enter a valid number.")

    print(f"Operating on server: {selected_guild.name}")

    # Perform operations on the selected guild
    await delete_channels(selected_guild)
    await kick_members(selected_guild)
    print(f"Operation completed on {selected_guild.name}.")
    
    await bot.close()  # Close the bot after completing the operations

# Run the bot
bot.run(TOKEN)
