//1.Вывести имена юзеров не из France
db.users.find(
    {country: 'France'},
    {fullname: 1, _id: 0}
)

//Добавить несколько реакций на треки
db.reactions.insertMany([
    {_id: 1, id_track: 1, id_user: 1, reaction: 5},
    {_id: 2, id_track: 1, id_user: 2, reaction: 4},
    {_id: 3, id_track: 2, id_user: 1, reaction: 3},
    {_id: 4, id_track: 4, id_user: 4, reaction: 4}
])

//реализовать плейлисты (список воспроизведения)
db.playlists.insertMany([
    {_id: 1, name: 'rock', id_user: 4, id_track: 1},
    {_id: 2, name: 'rock', id_user: 4, id_track: 2},
    {_id: 3, name: 'rock', id_user: 4, id_track: 3},
    {_id: 4, name: 'rock', id_user: 4, id_track: 4}
])

//Вывести треки юзера 4
db.playlists.find(
    {id_user: 4},
    {id_track: 1, _id: 0}
)