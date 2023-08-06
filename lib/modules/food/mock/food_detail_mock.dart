import 'package:app/modules/food/models/food_detail_model/food_detail_model.dart';

abstract class FoodDetailMock{

  static FoodDetailModel mockDetail (){
    return const FoodDetailModel(
      image: 'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      name: 'Omelete de legumes com batata e guacamole',
      description: '',
      category: 'Almoço',
      duration: '30',
      difficulty: 'Média',
      servings: 2,
      isFavorite: true,
      kcal: 210,
      fats: 91,
      carbs: 65,
      proteins: 27,
      ingredients: [
        '1 colher de sopa óleo',
        '10 g salsinha',
        '1 grande ovo',
        '1 xícara abobrinha ralada',
        '1 xícara, cortados ou fatiados tomate',
        '1 pitada sal',
        '1 xícara, raladas cenoura',
      ],
      preparation: 'Em uma tigela, bata os ovos com o sal. Acrescente os legumes ralados e a salsinha picadinha.\n\n'
          'Em fogo baixo, numa frigideira anti aderente, acrescente o óleo.\n\n'
          'Coloque da receita, deixe dourar, vire e frite do outro lado. Sirva com alface picada e tomate.'
    );
  }

  static List<Map<String, dynamic>> mockJson(){
    return [
      {
        "id": null,
        "name": "Panquecas de Aveia e Banana",
        "description": "Panquecas saudáveis feitas com aveia e banana.",
        "category": "Café da manhã",
        "image": "https://images.pexels.com/photos/2097096/pexels-photo-2097096.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "20",
        "preparation": "Em um liquidificador, bata a aveia, bananas, leite e ovos até obter uma massa homogênea.\n\nAqueça uma frigideira antiaderente e despeje pequenas porções da massa para formar as panquecas.\n\nCozinhe por 2-3 minutos de cada lado ou até dourar.\n\nSirva com fatias de banana e mel.",
        "ingredients": [
          "1 xícara de aveia em flocos",
          "2 bananas maduras",
          "1 xícara de leite",
          "2 ovos",
          "Fatias de banana e mel para servir"
        ],
        "tags": [
          "Café da manhã",
          "Panquecas",
          "Aveia",
          "Banana",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 300,
        "fats": 8,
        "carbs": 50,
        "proteins": 10
      },
      {
        "id": null,
        "name": "Smoothie de Frutas Vermelhas",
        "description": "Um delicioso smoothie refrescante feito com frutas vermelhas.",
        "category": "Café da manhã",
        "image": "https://images.pexels.com/photos/3732897/pexels-photo-3732897.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "10",
        "preparation": "Em um liquidificador, adicione as frutas vermelhas, iogurte e mel.\n\nBata até obter uma mistura suave e homogênea.\n\nSirva em copos altos e decore com algumas frutas vermelhas frescas.",
        "ingredients": [
          "1 xícara de frutas vermelhas (morangos, framboesas, mirtilos)",
          "1 xícara de iogurte natural",
          "1 colher de sopa de mel",
          "Frutas vermelhas frescas para decorar"
        ],
        "tags": [
          "Café da manhã",
          "Smoothie",
          "Frutas vermelhas",
          "Refrescante",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 180,
        "fats": 3,
        "carbs": 35,
        "proteins": 5
      },
      {
        "id": null,
        "name": "Tapioca Recheada com Queijo e Tomate",
        "description": "Uma opção deliciosa e rápida para o café da manhã.",
        "category": "Café da manhã",
        "image": "https://images.pexels.com/photos/607386/pexels-photo-607386.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "15",
        "preparation": "Em uma frigideira antiaderente, espalhe a goma de tapioca formando um círculo.\n\nQuando a tapioca estiver unida e firme, adicione o queijo e tomate picados de um lado.\n\nDobre a tapioca ao meio e pressione levemente para grudar o recheio.\n\nDeixe cozinhar por mais alguns minutos até o queijo derreter.\n\nSirva quente.",
        "ingredients": [
          "2 colheres de sopa de goma de tapioca",
          "50g de queijo branco em cubos",
          "1 tomate pequeno picado"
        ],
        "tags": [
          "Café da manhã",
          "Tapioca",
          "Queijo",
          "Tomate",
          "Rápido",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 1,
        "isFavorite": true,
        "kcal": 250,
        "fats": 7,
        "carbs": 30,
        "proteins": 12
      },
      {
        "id": null,
        "name": "Omelete de Espinafre e Queijo Cottage",
        "description": "Omelete leve e nutritiva com espinafre e queijo cottage.",
        "category": "Café da manhã",
        "image": "https://images.pexels.com/photos/811738/pexels-photo-811738.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "20",
        "preparation": "Em uma tigela, bata os ovos com uma pitada de sal e pimenta.\n\nAdicione o espinafre picado e o queijo cottage à mistura de ovos.\n\nAqueça uma frigideira com um pouco de azeite e despeje a mistura.\n\nCozinhe em fogo médio até que os ovos estejam firmes.\n\nDobre a omelete ao meio e sirva.",
        "ingredients": [
          "3 ovos",
          "1 xícara de espinafre picado",
          "1/2 xícara de queijo cottage",
          "Sal e pimenta a gosto",
          "Azeite para untar a frigideira"
        ],
        "tags": [
          "Café da manhã",
          "Omelete",
          "Espinafre",
          "Queijo cottage",
          "Saudável"
        ],
        "difficulty": "Média",
        "servings": 1,
        "isFavorite": true,
        "kcal": 220,
        "fats": 15,
        "carbs": 5,
        "proteins": 18
      },
      {
        "id": null,
        "name": "Pão Integral com Abacate e Ovo",
        "description": "Uma combinação deliciosa e nutritiva para começar o dia.",
        "category": "Café da manhã",
        "image": "https://images.pexels.com/photos/3788939/pexels-photo-3788939.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "15",
        "preparation": "Toste o pão integral até ficar crocante.\n\nAmasse o abacate e tempere com limão, sal e pimenta a gosto.\n\nEspalhe o abacate amassado sobre o pão torrado.\n\nEm uma frigideira, frite o ovo com um pouco de azeite até a gema ficar no ponto desejado.\n\nColoque o ovo sobre o abacate e tempere com mais sal e pimenta, se necessário.",
        "ingredients": [
          "2 fatias de pão integral",
          "1 abacate maduro",
          "Suco de 1/2 limão",
          "1 ovo",
          "Sal e pimenta a gosto",
          "Azeite"
        ],
        "tags": [
          "Café da manhã",
          "Pão integral",
          "Abacate",
          "Ovo",
          "Nutritivo",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 1,
        "isFavorite": true,
        "kcal": 350,
        "fats": 20,
        "carbs": 25,
        "proteins": 15
      },
      {
        "id": null,
        "name": "Iogurte com Granola e Frutas",
        "description": "Uma opção leve e saborosa para o café da manhã.",
        "category": "Café da manhã",
        "image": "https://images.pexels.com/photos/952343/pexels-photo-952343.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "5",
        "preparation": "Em uma tigela, coloque o iogurte natural.\n\nAcrescente granola e frutas frescas por cima.\n\nFinalize com um fio de mel ou maple syrup.",
        "ingredients": [
          "1 xícara de iogurte natural",
          "1/2 xícara de granola",
          "Frutas frescas (morangos, mirtilos, banana, etc.)",
          "Mel ou maple syrup a gosto"
        ],
        "tags": [
          "Café da manhã",
          "Iogurte",
          "Granola",
          "Frutas",
          "Leve",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 1,
        "isFavorite": true,
        "kcal": 250,
        "fats": 6,
        "carbs": 40,
        "proteins": 10
      },
      {
        "id": null,
        "name": "Crepioca com Queijo e Tomate",
        "description": "Uma versão saudável da crepioca tradicional.",
        "category": "Café da manhã",
        "image": "https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "15",
        "preparation": "Em uma tigela, misture a goma de tapioca com o ovo e uma pitada de sal.\n\nDespeje a mistura em uma frigideira quente e espalhe para formar a crepioca.\n\nQuando a massa estiver firme, adicione o queijo e tomate picados de um lado.\n\nDobre a crepioca ao meio e pressione levemente para grudar o recheio.\n\nDeixe cozinhar por mais alguns minutos até o queijo derreter.\n\nSirva quente.",
        "ingredients": [
          "2 colheres de sopa de goma de tapioca",
          "1 ovo",
          "50g de queijo branco em cubos",
          "1 tomate pequeno picado"
        ],
        "tags": [
          "Café da manhã",
          "Crepioca",
          "Queijo",
          "Tomate",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 1,
        "isFavorite": true,
        "kcal": 280,
        "fats": 10,
        "carbs": 25,
        "proteins": 15
      },
      {
        "id": null,
        "name": "Açaí Bowl com Granola e Frutas",
        "description": "Uma opção refrescante e nutritiva para o café da manhã.",
        "category": "Café da manhã",
        "image": "https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "10",
        "preparation": "No liquidificador, bata a polpa de açaí com um pouco de água até obter uma consistência cremosa.\n\nDespeje o açaí em uma tigela.\n\nAdicione granola, fatias de banana, mirtilos e outras frutas de sua preferência por cima.\n\nFinalize com algumas folhas de hortelã.",
        "ingredients": [
          "1 xícara de polpa de açaí",
          "Água",
          "Granola",
          "Fatias de banana",
          "Mirtilos",
          "Frutas frescas",
          "Folhas de hortelã"
        ],
        "tags": [
          "Café da manhã",
          "Açaí",
          "Granola",
          "Frutas",
          "Refrescante",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 1,
        "isFavorite": true,
        "kcal": 350,
        "fats": 10,
        "carbs": 60,
        "proteins": 5
      },
      {
        "id": null,
        "name": "Torrada de Abacate com Ovo Poche",
        "description": "Uma torrada saudável e deliciosa com abacate e ovo pochê.",
        "category": "Café da manhã",
        "image": "https://images.pexels.com/photos/2599491/pexels-photo-2599491.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "15",
        "preparation": "Amasse o abacate e tempere com limão, sal e pimenta a gosto.\n\nEm uma panela com água fervente e vinagre, faça um redemoinho e coloque o ovo para cozinhar por 3-4 minutos.\n\nToste o pão integral.\n\nEspalhe o abacate amassado sobre a torrada e coloque o ovo pochê por cima.\n\nFinalize com um pouco de sal e pimenta.",
        "ingredients": [
          "1/2 abacate maduro",
          "Suco de 1/2 limão",
          "1 ovo",
          "1 fatia de pão integral",
          "Sal e pimenta a gosto",
          "Vinagre"
        ],
        "tags": [
          "Café da manhã",
          "Torrada",
          "Abacate",
          "Ovo pochê",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 1,
        "isFavorite": true,
        "kcal": 270,
        "fats": 15,
        "carbs": 20,
        "proteins": 12
      },
      {
        "id": null,
        "name": "Mingau de Aveia com Canela e Maçã",
        "description": "Um mingau cremoso e reconfortante para o café da manhã.",
        "category": "Café da manhã",
        "image": "https://images.pexels.com/photos/1514920/pexels-photo-1514920.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "15",
        "preparation": "Em uma panela, aqueça o leite com a aveia em flocos e a canela.\n\nCozinhe em fogo médio, mexendo sempre, até que a aveia fique bem cremosa.\n\nAdicione mel ou adoçante a gosto.\n\nCorte a maçã em cubos e coloque por cima do mingau.\n\nSirva quente.",
        "ingredients": [
          "1 xícara de aveia em flocos",
          "2 xícaras de leite",
          "1 colher de chá de canela em pó",
          "Mel ou adoçante a gosto",
          "1 maçã"
        ],
        "tags": [
          "Café da manhã",
          "Mingau",
          "Aveia",
          "Canela",
          "Maçã",
          "Reconfortante",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 280,
        "fats": 6,
        "carbs": 45,
        "proteins": 10
      },
      {
        "id": null,
        "name": "Salada de Quinoa com Legumes Assados",
        "description": "Uma deliciosa salada nutritiva feita com quinoa e legumes assados.",
        "category": "Almoço",
        "image": "https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "40",
        "preparation": "Lave a quinoa e cozinhe conforme as instruções da embalagem.\n\nEnquanto a quinoa cozinha, pré-aqueça o forno a 200°C.\n\nCorte abobrinha, berinjela, cenoura e pimentão em pedaços e coloque-os em uma assadeira. Tempere com azeite, sal, pimenta e ervas a gosto.\n\nAsse os legumes por cerca de 20-25 minutos ou até que fiquem macios e dourados.\n\nEm uma tigela grande, misture os legumes assados com a quinoa cozida.\n\nFinalize com suco de limão, coentro picado e sementes de gergelim.\n\nSirva em temperatura ambiente.",
        "ingredients": [
          "1 xícara de quinoa",
          "1 abobrinha média",
          "1 berinjela média",
          "1 cenoura",
          "1 pimentão vermelho",
          "2 colheres de sopa de azeite",
          "Sal e pimenta a gosto",
          "Coentro fresco picado",
          "Sementes de gergelim",
          "Suco de 1 limão"
        ],
        "tags": [
          "Almoço",
          "Salada",
          "Quinoa",
          "Legumes",
          "Assado",
          "Refeição saudável"
        ],
        "difficulty": "Fácil",
        "servings": 4,
        "isFavorite": true,
        "kcal": 280,
        "fats": 10,
        "carbs": 45,
        "proteins": 12
      },
      {
        "id": null,
        "name": "Sopa de Lentilha e Vegetais",
        "description": "Uma saborosa sopa rica em proteínas e vitaminas, perfeita para dias mais frios.",
        "category": "Almoço",
        "image": "https://images.pexels.com/photos/262918/pexels-photo-262918.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "45",
        "preparation": "Em uma panela grande, aqueça o azeite e refogue a cebola e o alho até dourarem.\n\nAdicione os legumes picados (cenoura, abobrinha, tomate) e refogue por mais alguns minutos.\n\nLave bem a lentilha e adicione à panela juntamente com o caldo de legumes.\n\nTempere com sal, pimenta, cominho e outras ervas de sua preferência.\n\nDeixe cozinhar em fogo médio por cerca de 30 minutos ou até que a lentilha e os legumes estejam macios.\n\nSirva quente, decorado com folhas de coentro fresco.",
        "ingredients": [
          "1 xícara de lentilha",
          "1 cebola picada",
          "2 dentes de alho picados",
          "1 cenoura grande",
          "1 abobrinha",
          "2 tomates",
          "1 litro de caldo de legumes",
          "2 colheres de sopa de azeite",
          "Sal e pimenta a gosto",
          "Cominho em pó",
          "Coentro fresco para decorar"
        ],
        "tags": [
          "Almoço",
          "Sopa",
          "Lentilha",
          "Vegetais",
          "Refeição saudável",
          "Proteínas"
        ],
        "difficulty": "Média",
        "servings": 6,
        "isFavorite": true,
        "kcal": 210,
        "fats": 6,
        "carbs": 35,
        "proteins": 9
      },
      {
        "id": null,
        "name": "Wrap de Frango com Vegetais",
        "description": "Um delicioso wrap de frango recheado com vegetais frescos.",
        "category": "Almoço",
        "image": "https://images.pexels.com/photos/4050293/pexels-photo-4050293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "20",
        "preparation": "Tempere os filés de frango com sal, pimenta, alho em pó e páprica.\n\nEm uma frigideira quente, grelhe os filés de frango até que estejam cozidos por completo.\n\nEnquanto o frango grelha, aqueça as tortilhas em outra frigideira.\n\nPara montar os wraps, coloque um filé de frango grelhado no centro de cada tortilha.\n\nAdicione alface picada, rodelas de tomate, pimentão e cenoura ralada.\n\nDobre as bordas da tortilha para dentro e enrole bem.\n\nCorte os wraps ao meio e sirva.",
        "ingredients": [
          "2 filés de frango",
          "4 tortilhas de trigo integral",
          "Alface picada",
          "2 tomates",
          "1 pimentão",
          "1 cenoura",
          "Sal, pimenta, alho em pó e páprica a gosto"
        ],
        "tags": [
          "Almoço",
          "Wrap",
          "Frango",
          "Vegetais",
          "Refeição saudável",
          "Proteínas"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 300,
        "fats": 8,
        "carbs": 40,
        "proteins": 20
      },
      {
        "id": null,
        "name": "Salada de Grão de Bico e Atum",
        "description": "Uma salada rica em proteínas e fibras, ideal para uma refeição leve.",
        "category": "Almoço",
        "image": "https://images.pexels.com/photos/1327839/pexels-photo-1327839.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "25",
        "preparation": "Em uma tigela grande, misture o grão de bico cozido, o atum em pedaços, tomate cereja cortado ao meio e pepino em cubos.\n\nTempere com azeite, suco de limão, sal, pimenta e orégano a gosto.\n\nFinalize com folhas de rúcula e queijo feta por cima.\n\nSirva fria.",
        "ingredients": [
          "1 lata de grão de bico cozido",
          "1 lata de atum em água",
          "1 xícara de tomate cereja",
          "1 pepino",
          "Azeite",
          "Suco de 1 limão",
          "Sal e pimenta a gosto",
          "Orégano",
          "Folhas de rúcula",
          "Queijo feta"
        ],
        "tags": [
          "Almoço",
          "Salada",
          "Grão de bico",
          "Atum",
          "Proteínas",
          "Refeição saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 250,
        "fats": 10,
        "carbs": 30,
        "proteins": 18
      },
      {
        "id": null,
        "name": "Peixe Grelhado com Aspargos e Batata-doce",
        "description": "Uma refeição leve e saborosa com peixe grelhado e legumes.",
        "category": "Almoço",
        "image": "https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "30",
        "preparation": "Tempere o filé de peixe com sal, pimenta e suco de limão.\n\nEm uma frigideira quente, grelhe o peixe por alguns minutos de cada lado até ficar cozido.\n\nEnquanto o peixe grelha, corte os aspargos e a batata-doce em pedaços e cozinhe no vapor ou em água fervente até ficarem macios.\n\nSirva o peixe grelhado com os aspargos e a batata-doce cozidos.",
        "ingredients": [
          "2 filés de peixe (salmão, tilápia, etc.)",
          "Suco de 1 limão",
          "Sal e pimenta a gosto",
          "1 maço de aspargos",
          "1 batata-doce grande"
        ],
        "tags": [
          "Almoço",
          "Peixe",
          "Grelhado",
          "Aspargos",
          "Batata-doce",
          "Refeição saudável"
        ],
        "difficulty": "Média",
        "servings": 2,
        "isFavorite": true,
        "kcal": 300,
        "fats": 8,
        "carbs": 40,
        "proteins": 25
      },
      {
        "id": null,
        "name": "Tacos de Frango com Guacamole",
        "description": "Uma opção deliciosa e saudável de tacos com frango e guacamole.",
        "category": "Almoço",
        "image": "https://images.pexels.com/photos/262945/pexels-photo-262945.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "40",
        "preparation": "Tempere os filés de frango com sal, pimenta, cominho e alho em pó.\n\nEm uma frigideira quente, grelhe os filés de frango até que estejam cozidos por completo.\n\nEnquanto o frango grelha, prepare o guacamole: amasse o abacate e misture com tomate, cebola, coentro, suco de limão e pimenta a gosto.\n\nAqueça as tortilhas em outra frigideira.\n\nPara montar os tacos, coloque uma porção de frango grelhado em cada tortilha e adicione guacamole por cima.\n\nDecore com folhas de coentro e sirva.",
        "ingredients": [
          "2 filés de frango",
          "4 tortilhas de milho",
          "2 abacates maduros",
          "1 tomate picado",
          "1 cebola picada",
          "Coentro picado",
          "Suco de 1 limão",
          "Sal, pimenta, cominho e alho em pó a gosto"
        ],
        "tags": [
          "Almoço",
          "Tacos",
          "Frango",
          "Guacamole",
          "Refeição saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 320,
        "fats": 12,
        "carbs": 30,
        "proteins": 22
      },
      {
        "id": null,
        "name": "Ratatouille com Arroz Integral",
        "description": "Uma versão saudável do clássico ratatouille acompanhado de arroz integral.",
        "category": "Almoço",
        "image": "https://images.pexels.com/photos/1623886/pexels-photo-1623886.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "50",
        "preparation": "Corte a berinjela, abobrinha, pimentão e tomate em rodelas finas.\n\nEm uma assadeira, intercale as rodelas de legumes e adicione alho picado e ervas a gosto.\n\nRegue com azeite e leve ao forno preaquecido a 200°C por 30-35 minutos, ou até os legumes ficarem macios e dourados.\n\nEnquanto os legumes assam, cozinhe o arroz integral conforme as instruções da embalagem.\n\nSirva o ratatouille acompanhado do arroz integral.",
        "ingredients": [
          "1 berinjela",
          "1 abobrinha",
          "1 pimentão vermelho",
          "2 tomates",
          "2 dentes de alho picados",
          "Ervas a gosto (orégano, tomilho, alecrim)",
          "Azeite",
          "1 xícara de arroz integral",
          "Sal e pimenta a gosto"
        ],
        "tags": [
          "Almoço",
          "Ratatouille",
          "Arroz integral",
          "Legumes",
          "Refeição saudável"
        ],
        "difficulty": "Fácil",
        "servings": 4,
        "isFavorite": true,
        "kcal": 250,
        "fats": 6,
        "carbs": 40,
        "proteins": 8
      },
      {
        "id": null,
        "name": "Hambúrguer de Quinoa e Cogumelos",
        "description": "Um hambúrguer vegetariano saudável e saboroso feito com quinoa e cogumelos.",
        "category": "Almoço",
        "image": "https://images.pexels.com/photos/9311/food-wood-cooking-grill.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "40",
        "preparation": "Em uma panela, cozinhe a quinoa conforme as instruções da embalagem e reserve.\n\nEm outra panela, refogue cebola e alho em um pouco de azeite.\n\nAdicione os cogumelos picados e cozinhe até que fiquem macios.\n\nEm uma tigela grande, misture a quinoa cozida, cogumelos refogados, farinha de aveia, salsinha picada e temperos a gosto.\n\nMolde a mistura em formato de hambúrgueres.\n\nGrelhe os hambúrgueres em uma frigideira ou churrasqueira por alguns minutos de cada lado.\n\nSirva os hambúrgueres em pães integrais com alface, tomate e outros acompanhamentos de sua preferência.",
        "ingredients": [
          "1 xícara de quinoa cozida",
          "200g de cogumelos frescos",
          "1/2 cebola picada",
          "2 dentes de alho picados",
          "2 colheres de sopa de farinha de aveia",
          "Salsinha picada",
          "Azeite",
          "Pães integrais",
          "Alface e tomate para acompanhar"
        ],
        "tags": [
          "Almoço",
          "Hambúrguer",
          "Quinoa",
          "Cogumelos",
          "Vegetariano",
          "Saudável"
        ],
        "difficulty": "Média",
        "servings": 4,
        "isFavorite": true,
        "kcal": 240,
        "fats": 7,
        "carbs": 35,
        "proteins": 10
      },
      {
        "id": null,
        "name": "Espaguete Integral com Pesto de Manjericão",
        "description": "Um prato de massa saudável e delicioso com pesto de manjericão.",
        "category": "Almoço",
        "image": "https://images.pexels.com/photos/1598877/pexels-photo-1598877.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "25",
        "preparation": "Cozinhe o espaguete integral conforme as instruções da embalagem.\n\nEnquanto a massa cozinha, prepare o pesto: bata as folhas de manjericão, alho, castanha de caju, azeite, suco de limão, sal e pimenta no liquidificador até obter uma pasta.\n\nEscorra a massa cozida e misture com o pesto.\n\nSirva o espaguete integral com queijo parmesão ralado por cima.",
        "ingredients": [
          "200g de espaguete integral",
          "1 maço de manjericão",
          "2 dentes de alho",
          "1/4 de xícara de castanha de caju",
          "1/2 xícara de azeite",
          "Suco de 1 limão",
          "Sal e pimenta a gosto",
          "Queijo parmesão ralado"
        ],
        "tags": [
          "Almoço",
          "Espaguete integral",
          "Pesto",
          "Manjericão",
          "Refeição saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 320,
        "fats": 12,
        "carbs": 45,
        "proteins": 10
      },
      {
        "id": null,
        "name": "Salmão Assado com Legumes",
        "description": "Um prato rico em ômega-3 e antioxidantes, perfeito para uma refeição saudável.",
        "category": "Almoço",
        "image": "https://images.pexels.com/photos/262918/pexels-photo-262918.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "35",
        "preparation": "Tempere o filé de salmão com sal, pimenta, alho em pó e suco de limão.\n\nEm uma assadeira, coloque o filé de salmão e adicione cenoura, brócolis e batata-doce em pedaços.\n\nRegue com azeite e asse no forno preaquecido a 200°C por 20-25 minutos, ou até o salmão ficar cozido e os legumes macios.\n\nSirva o salmão assado com os legumes.",
        "ingredients": [
          "2 filés de salmão",
          "Suco de 1 limão",
          "Sal, pimenta e alho em pó a gosto",
          "1 cenoura",
          "1 maço de brócolis",
          "1 batata-doce grande",
          "Azeite"
        ],
        "tags": [
          "Almoço",
          "Salmão",
          "Assado",
          "Legumes",
          "Refeição saudável",
          "Ômega-3",
          "Antioxidantes"
        ],
        "difficulty": "Média",
        "servings": 2,
        "isFavorite": true,
        "kcal": 300,
        "fats": 12,
        "carbs": 30,
        "proteins": 25
      }
    ];
  }

}