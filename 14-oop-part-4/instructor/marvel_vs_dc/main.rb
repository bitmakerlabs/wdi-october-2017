require_relative 'superheroes'

supergirl = Kryptonian.new('Kara Danvers')
robin = BatPerson.new('Dick Grayson')
wonderwoman = Amazonian.new('Diana Prince')
x23 = XWeapon.new('X-23')
flash = Speedster.new('Barry Allen')
ironman = IronPerson.new('Tony Stark')


superman = Kryptonian.new('Clark Kent')
batman = BatPerson.new('Bruce Wayne')
wolverine = XWeapon.new('Logan')

superman.fly
batman.hit(wolverine)
puts "#{ wolverine.name }: #{ wolverine.health }"
superman.hit(wolverine)
puts "#{ wolverine.name }: #{ wolverine.health }"
wolverine.rest
puts "#{ wolverine.name }: #{ wolverine.health }"

batman.activate_shield
superman.hit(batman)
puts "#{ batman.name }: #{ batman.health }"
superman.hit(batman)
puts "#{ batman.name }: #{ batman.health }"

superman.land
batman.fire_super_weapon(superman)
puts "#{ superman.name }: #{ superman.health }"

#puts "#{ hero1.name } conscious?: #{ hero1.conscious?}"
