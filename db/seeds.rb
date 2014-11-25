# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

##############
# Admin User #
##############

User.create(name: 'Mr Admin', email: 'admin@playrate.me', password: 'password', password_confirmation: 'password', admin: true)

#########################
# Sports/Positions data #
#########################

lacrosse = Sport.create(name: 'Lacrosse')
basketball = Sport.create(name: 'Basketball')

# Lacrosse Positions

attack = lacrosse.positions.build(name: 'Attack')
attack.stats = ['Games played', 'Goals', 'Assists', 'Total Points',
                'Avg. Points per Game', 'Ground Balls', 'Height (ft/inch)']
attack.save

midfield = lacrosse.positions.build(name: 'Midfield')
midfield.stats = ['Goals', 'Assists', 'Total Points', 'Avg. Points per Game',
                  'Ground Balls', 'Face-offs Won', 'Face-offs Lost',
                  'Face-off Percentage', 'Height (ft/inch)']
midfield.save

defense = lacrosse.positions.build(name: 'Defense')
defense.stats = ['Caused Turnovers', 'Ground Balls', 'Assists', 'Goals',
                 'Height (ft/inch)']
defense.save

goalie = lacrosse.positions.build(name: 'Goalie')
goalie.stats = ['Games Played', 'Shots Faced', 'Saves', 'Save %',
                'Goals Allowed', 'Goals Allowed Avg.', 'Height (ft/inch)']
goalie.save

# Basketball Positions

# universal stats for b-ball
bball_stats = ['Games Played', 'FG', 'FGA', 'FG%', 'FG3', 'FG3A', 'FG3%', 'FT', 'FTA', 'FT%', 'PTS Total', 'Avg. Points per Game',
'Reb', 'Reb Avg.', 'Assists', 'Avg. Assist per Game', 'Steals', 'Steal Avg. per Game', 'Blocks', 'Blocks Avg. per Game', 'Height (ft/inch)']

forward = basketball.positions.build(name: 'Forward')
forward.stats = bball_stats
forward.save

center = basketball.positions.build(name: 'Center')
center.stats = bball_stats
center.save

guard = basketball.positions.build(name: 'Guard')
guard.stats = bball_stats
guard.save