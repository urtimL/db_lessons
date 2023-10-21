//Вывести названия треков без тега test
db.tracks.find(
    {
		tags: {$nin: ['test']}
	}
)

//Вывести ко-во треков с продолжительностью до одного часа с тегом new
db.tracks.countDocuments(
    {
        tags: 'new',
        duration_secs: { $lte: 60 * 60 }
    }
)

//Увеличить баланс заблокированных юзеров не из Germany на 5%
db.users.updateMany(
    {
		country: { $ne: 'Germany' },
		is_blocked: true
	},
    {
		$mul: { balance: 1.05 }
    }
)

//Добавить всем трекам теги fresh и popular
db.tracks.find(
    {},
    {
		$addToSet: {tags: {	$each: ['fresh', 'popular']}}
	}
)