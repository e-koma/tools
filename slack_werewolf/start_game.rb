# frozen_string_literal: true

require 'slack-notifier'
require 'yaml'

# notify WereWolf Game's role to slack DM
class WereWolfRoleAllocater
  WEBHOOK_URL = ENV['WEBHOOK_URL']

  def initialize
    @yaml = YAML.load_file('./settings.yml')
    @players = @yaml['players']
    validate(@players)
  end

  def allocate
    roles = generate_role_list

    allocated_role_list = ''
    @players.each do |player|
      role = roles.delete_at(rand(roles.count))
      allocated_role_list += "#{player}: #{role}\n"
      notify_slack("@#{player}", generate_role_message(role))
    end
    print allocated_role_list
  end

  private

  def validate(players)
    return if players.count == @yaml['allocation'].values.sum

    puts('Error: playerとallocationの人数が違います')
    abort
  end

  def generate_role_list
    roles = []
    @yaml['allocation'].each do |role, num|
      num.times { roles.push(role) }
    end
    roles
  end

  def generate_role_message(role)
    message = "こんにちは。ゲームマスターです。\n今回のあなたの役職は\n```#{role}```\nです。\n"
    @yaml['role'][role].each do |k, v|
      message += "*#{k}*: #{v}\n"
    end
    message
  end

  def notify_slack(channel, message)
    notifier = Slack::Notifier.new(
      WEBHOOK_URL,
      icon_emoji: ':werewolf:',
      username: 'GameMaster'
    )
    notifier.post(channel: channel, text: message)
  end
end

werewolf = WereWolfRoleAllocater.new
werewolf.allocate
