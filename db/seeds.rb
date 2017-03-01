# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

posts = Post.create([
                      { title: 'Poem', topic: 'Chinese', content: '无论是解脱也好成就佛道也好最重要的莫过于深信因果。因为就算是空性，空性的本性也脱离不了因果。所以一切法的根本就是因果。脱离因果的一切法就是因果。' },
                      { title: 'English Poem', topic: 'English', content: 'I haven been talking much recently, at first i thought sharing the dharma and preventing people from entering into wrong views and misconception is great merits but as i do my foundation i think in this dark ages keeping my mouth shut is greater merits, thus i shall let silent be the dharma teacher, sometime not saying a word can be the greatest teaching ever. afterall the buddha have not spoken a single word in his 49 years of teaching.
The dharma is beyond words and non words and the nature of the mind is beyond thoughts and non thoughts, boddicitta is beyond expression and the right view of emptiness is beyond mere silence.
Thus what ever arise, let it arise, what ever cease, let it cease, like ocean waves this is the nature, the nature of the waves, but keep in mind that the sea bed is forever stable, that is the real nature. watch the waves but keep in mind the real nature and you shall never be seperated from boddicttia.' },
                      { title: 'Master', topic: 'English', content: 'The master continue "look nowhere my dear student, look nowhere. Seek no path my dear student, seek no path. The day you see me as a Buddha is the day you know the truth. Every Path that does not link to the Buddha nature is nothing but temperol. The only Buddha dharma is the mind, the mind is the pure essense of the Buddha dharma , the Buddha dharma is nothing but the nature of the mind. "' },
                      { title: 'Morning', topic: 'Day', content: 'Good Morning, to everyone here. How are you all?
There are many well learn dharma individuals out there, they read tons of books and attend tons of lectures on dharma, they can write very well some can even write books. But knowing the concepts of dharma or being able to perform pujas and mundras and play muscial instrumnts does not mean any wisdom attainments.' },
                      { title: 'Food', topic: 'Night', content: 'If you ask me how much i know about the Dharma and how much effort I put into practing the dharma my ans would b
"I dont know any Dharma, I never learn any Dharma, and even if I did I have already forgotten them"' }

                    ])
