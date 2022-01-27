class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'J-POP' },
    { id: 3, name: 'ROCK' },
    { id: 4, name: 'PUNK' },
    { id: 5, name: 'METAL' },
    { id: 6, name: 'HIP-HOP' },
    { id: 7, name: 'レゲエ' },
    { id: 8, name: 'TRAP' },
    { id: 9, name: 'DUBSTEP' },
    { id: 10, name: 'CHILL' },
    { id: 11, name: 'DANCE-MUSIC' },
    { id: 12, name: 'K-POP' },
    { id: 13, name: "DRUM'N'BASE" },
    { id: 14, name: 'R&B' },
    { id: 15, name: 'POPS' },
    { id: 16, name: 'HOUSE' }
  ]

  include ActiveHash::Associations
  has_many :users
  end