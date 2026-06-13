extends Node



var template :Dictionary = {
	"id" : "",
	"name" : "",
	"family" : "",
	"description" : "",
	"capture" : "",
	"texture" : ""
}

var coregone :Dictionary = {
	"index" : "1",
	"name" : "Corégone blanc",
	"family" : "Salmonidées",
	"description" : "Ce sont de petits poissons blancs qui n'atteignent pas 30 cm. Ils ont une sacré paire d'yeux par contre. Je me sens mal chaque fois que l'un d'entre eux me fixe.",
	"capture" : "Ils vivent en groupes, plutôt profondément (tu n'en trouveras jamais dans une mare ou un petit étang). Ils remontent la nuit pas contre.",
	"texture" : preload("res://Visuals/poissons/coregone.jpg")
}

var carpe :Dictionary = {
	"index" : "2",
	"name" : "Carpe",
	"family" : "Cyprinidés",
	"description" : "Me dis pas que t'as jamais vu une carpe !",
	"capture" : "Ce sont de bonnes mémères, elles aiment bien les courants lents, voire pas de courant du tout, comme dans les mares, les étangs, les lacs, surtout s'ils sont un peu chauds.",
	"texture" : preload("res://Visuals/poissons/carpe.jpg")
}

var tanche :Dictionary = {
	"index" : "3",
	"name" : "Tanche",
	"family" : "Cyprinidés",
	"description" : "Les tanches sont de couleur verte foncé à jaune dorée. Elles sont recouvertes d'une espèce de mucus super épais qui les rendent difficiles à tenir en main. Moi j'aime bien leur couleur. On a l'impression qu'il y a comme une lumière qui brille à l'intérieur.",
	"capture" : "Etangs peu profonds, cours d'eau lents voire sans courant.",
	"texture" : preload("res://Visuals/poissons/tanche.jpg")
}

var truite :Dictionary = {
	"index" : "4",
	"name" : "Truite",
	"family" : "Salmonidés",
	"description" : "Tu pourras tout essayer, il y aura toujours une de ces idiotes pour mordre à ton hameçon.",
	"capture" : "Partout.",
	"texture" : preload("res://Visuals/poissons/truite.png")
}

var silure :Dictionary = {
	"index" : "5",
	"name" : "Silure",
	"family" : "Siluridés",
	"description" : "Ça c'est de la bestiole ! Ils peuvent dépasser les 2 mètres et les 100 kg ! Ils ont une de ces machoires aussi. Une fois l'un d'entre eux m'a mordu. J'ai toujours la trace de ses crocs sur mon mollet gauche...",
	"capture" : "Du moment qu'il y a à bouffer, ils s'adaptent.",
	"texture" : preload("res://Visuals/poissons/silure.jpg")
}

var all_fishes :Array = [coregone, carpe, tanche, truite, silure]
