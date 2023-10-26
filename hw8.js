//Вывести среднюю реакцию по треку 1
db.tracks.aggregate([
    { $match:   { title: "Track 1" } },
    { $lookup:  { from: 'reactions', localField: '_id', foreignField: 'id_track', as: 'track' } },
    { $unwind: '$track' },
    { $group:   { _id: '$title', avg_reaction: { $avg: '$track.reaction' } } }
])

//Увеличить баланс всех незаблокированных юзеров на 0.5%
db.users.updateMany(
    { is_blocked: { $ne: true } },
    { $mul:       { balance: 1.005 } }
)

//Вывести ко-во реакций с оценкой 4
db.reactions.aggregate([
    { $match:   { reaction: 4 } },
    { $group:   { _id: null, total_reaction: { $count: {} } } },
    { $project: { total_reaction: 1, _id: 0 } }
])

//Вывести названия треков, принадлежащих юзеру 4
db.users.aggregate([
    { $match:  { _id: 4 } },
    { $lookup: { from: 'tracks', localField: '_id', foreignField: 'author_id', as: 'track' } },
    { $unwind: '$track' },
    { $project: { _id: 0, track_title: '$track.title' } }
])