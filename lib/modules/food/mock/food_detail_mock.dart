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
      },
      {
        "id": null,
        "name": "Risoto de Cogumelos",
        "description": "Um delicioso risoto cremoso feito com cogumelos frescos.",
        "category": "Jantar",
        "image": "https://images.pexels.com/photos/2092359/pexels-photo-2092359.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "40",
        "preparation": "Em uma panela, refogue cebola e alho em azeite até dourarem.\n\nAdicione os cogumelos picados e refogue até ficarem macios.\n\nAcrescente o arroz arbóreo e mexa por alguns minutos.\n\nAdicione o vinho branco e deixe evaporar.\n\nAos poucos, adicione o caldo de legumes quente, mexendo sempre, até o arroz ficar cozido e cremoso.\n\nFinalize com manteiga, queijo parmesão ralado e salsinha picada.\n\nSirva quente.",
        "ingredients": [
          "1 xícara de arroz arbóreo",
          "200g de cogumelos frescos",
          "1/2 cebola picada",
          "2 dentes de alho picados",
          "1/2 xícara de vinho branco",
          "1 litro de caldo de legumes",
          "2 colheres de sopa de manteiga",
          "Queijo parmesão ralado",
          "Salsinha picada",
          "Azeite, sal e pimenta a gosto"
        ],
        "tags": [
          "Jantar",
          "Risoto",
          "Cogumelos",
          "Refeição saudável"
        ],
        "difficulty": "Média",
        "servings": 4,
        "isFavorite": true,
        "kcal": 350,
        "fats": 12,
        "carbs": 50,
        "proteins": 10
      },
      {
        "id": null,
        "name": "Peixe Assado com Ervas",
        "description": "Um prato leve e saboroso de peixe assado com ervas.",
        "category": "Jantar",
        "image": "https://images.pexels.com/photos/2750779/pexels-photo-2750779.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "30",
        "preparation": "Tempere o filé de peixe com sal, pimenta, alho em pó e ervas frescas (salsinha, manjericão, tomilho).\n\nEm uma assadeira, coloque o filé de peixe e regue com azeite.\n\nLeve ao forno preaquecido a 200°C por 20-25 minutos, ou até o peixe ficar cozido e dourado.\n\nSirva quente, acompanhado de legumes assados ou salada.",
        "ingredients": [
          "2 filés de peixe (salmão, tilápia, etc.)",
          "Sal, pimenta e alho em pó a gosto",
          "Ervas frescas (salsinha, manjericão, tomilho)",
          "Azeite"
        ],
        "tags": [
          "Jantar",
          "Peixe",
          "Assado",
          "Ervas",
          "Refeição saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 250,
        "fats": 8,
        "carbs": 10,
        "proteins": 30
      },
      {
        "id": null,
        "name": "Abóbora Recheada com Quinoa e Legumes",
        "description": "Uma opção vegetariana e nutritiva para o jantar.",
        "category": "Jantar",
        "image": "https://images.pexels.com/photos/1565980/pexels-photo-1565980.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "45",
        "preparation": "Corte a abóbora ao meio e remova as sementes.\n\nRegue com azeite, sal e pimenta.\n\nAsse no forno preaquecido a 180°C por 30-35 minutos, ou até ficar macia.\n\nEnquanto a abóbora assa, cozinhe a quinoa conforme as instruções da embalagem.\n\nRefogue legumes de sua preferência em azeite.\n\nMisture a quinoa cozida com os legumes refogados e recheie as metades da abóbora.\n\nSirva quente.",
        "ingredients": [
          "1 abóbora média",
          "1 xícara de quinoa",
          "Legumes variados (cenoura, brócolis, couve-flor, etc.)",
          "Azeite, sal e pimenta a gosto"
        ],
        "tags": [
          "Jantar",
          "Abóbora",
          "Quinoa",
          "Legumes",
          "Vegetariano",
          "Refeição saudável"
        ],
        "difficulty": "Média",
        "servings": 2,
        "isFavorite": true,
        "kcal": 280,
        "fats": 10,
        "carbs": 40,
        "proteins": 12
      },
      {
        "id": null,
        "name": "Tacos Vegetarianos",
        "description": "Tacos recheados com vegetais e feijão preto.",
        "category": "Jantar",
        "image": "https://images.pexels.com/photos/2136909/pexels-photo-2136909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "30",
        "preparation": "Em uma frigideira, refogue cebola e alho em azeite.\n\nAdicione legumes picados (pimentão, abobrinha, cenoura) e refogue até ficarem macios.\n\nAcrescente o feijão preto cozido e temperos a gosto (páprica, cominho, coentro).\n\nAqueça as tortilhas de milho.\n\nPara montar os tacos, coloque a mistura de legumes e feijão preto em cada tortilha.\n\nAdicione guacamole, salsa, alface e queijo vegano.\n\nSirva quente.",
        "ingredients": [
          "8 tortilhas de milho",
          "1 lata de feijão preto cozido",
          "Legumes variados (pimentão, abobrinha, cenoura)",
          "1 cebola picada",
          "2 dentes de alho picados",
          "Azeite",
          "Temperos a gosto (páprica, cominho, coentro)",
          "Guacamole",
          "Salsa",
          "Alface",
          "Queijo vegano"
        ],
        "tags": [
          "Jantar",
          "Tacos",
          "Vegetariano",
          "Feijão preto",
          "Refeição saudável"
        ],
        "difficulty": "Fácil",
        "servings": 4,
        "isFavorite": true,
        "kcal": 320,
        "fats": 10,
        "carbs": 40,
        "proteins": 15
      },
      {
        "id": null,
        "name": "Salada de Camarão e Quinoa",
        "description": "Uma salada leve e sofisticada para o jantar.",
        "category": "Jantar",
        "image": "https://images.pexels.com/photos/4041469/pexels-photo-4041469.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "25",
        "preparation": "Cozinhe a quinoa conforme as instruções da embalagem e deixe esfriar.\n\nEm uma frigideira, grelhe os camarões temperados com sal e pimenta até ficarem rosados.\n\nEm uma tigela grande, misture a quinoa cozida, camarões grelhados, alface, rúcula e tomate-cereja.\n\nPrepare um molho com azeite, limão, mostarda e mel e regue a salada.\n\nSirva fria.",
        "ingredients": [
          "200g de camarão limpo",
          "1 xícara de quinoa cozida",
          "Alface",
          "Rúcula",
          "Tomate-cereja",
          "Azeite, limão, mostarda e mel para o molho",
          "Sal e pimenta a gosto"
        ],
        "tags": [
          "Jantar",
          "Salada",
          "Camarão",
          "Quinoa",
          "Refeição saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 300,
        "fats": 10,
        "carbs": 25,
        "proteins": 25
      },
      {
        "id": null,
        "name": "Macarrão Integral com Pesto de Manjericão e Nozes",
        "description": "Um prato saboroso e saudável de macarrão integral com pesto.",
        "category": "Jantar",
        "image": "https://images.pexels.com/photos/21492/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "30",
        "preparation": "Cozinhe o macarrão integral conforme as instruções da embalagem.\n\nEnquanto o macarrão cozinha, prepare o pesto: bata as folhas de manjericão, nozes, alho, azeite, queijo parmesão e sal no liquidificador até obter uma pasta.\n\nEscorra o macarrão e misture com o pesto.\n\nSirva quente, acompanhado de tomate cereja e folhas de manjericão.",
        "ingredients": [
          "200g de macarrão integral",
          "1 maço de manjericão",
          "1/2 xícara de nozes",
          "2 dentes de alho",
          "1/2 xícara de azeite",
          "1/4 de xícara de queijo parmesão ralado",
          "Tomate cereja",
          "Sal a gosto"
        ],
        "tags": [
          "Jantar",
          "Macarrão integral",
          "Pesto",
          "Manjericão",
          "Refeição saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 350,
        "fats": 15,
        "carbs": 45,
        "proteins": 10
      },
      {
        "id": null,
        "name": "Frango ao Curry com Leite de Coco",
        "description": "Um prato saboroso e exótico de frango ao curry com leite de coco.",
        "category": "Jantar",
        "image": "https://images.pexels.com/photos/2737086/pexels-photo-2737086.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "40",
        "preparation": "Em uma panela grande, refogue cebola e alho em azeite.\n\nAdicione pedaços de frango e refogue até dourarem.\n\nAcrescente pimentão, cenoura e batata-doce em cubos.\n\nAdicione curry em pó, gengibre ralado, sal e pimenta a gosto.\n\nCubra os ingredientes com leite de coco e deixe cozinhar em fogo baixo até os legumes ficarem macios e o frango cozido.\n\nSirva quente, acompanhado de arroz branco ou integral.",
        "ingredients": [
          "500g de peito de frango em cubos",
          "1 cebola picada",
          "2 dentes de alho picados",
          "1 pimentão",
          "2 cenouras",
          "1 batata-doce grande",
          "1 lata de leite de coco",
          "Curry em pó, gengibre ralado, sal e pimenta a gosto",
          "Azeite"
        ],
        "tags": [
          "Jantar",
          "Frango",
          "Curry",
          "Leite de coco",
          "Refeição saudável"
        ],
        "difficulty": "Média",
        "servings": 4,
        "isFavorite": true,
        "kcal": 380,
        "fats": 15,
        "carbs": 30,
        "proteins": 25
      },
      {
        "id": null,
        "name": "Ratatouille",
        "description": "Uma clássica receita francesa com legumes frescos e aromáticos.",
        "category": "Jantar",
        "image": "https://images.pexels.com/photos/1640775/pexels-photo-1640775.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "45",
        "preparation": "Em uma assadeira, coloque fatias de berinjela, abobrinha, tomate e cebola.\n\nRegue com azeite e tempere com alho, sal, pimenta, tomilho e alecrim.\n\nAsse no forno preaquecido a 180°C por 30-35 minutos, ou até os legumes ficarem macios e dourados.\n\nSirva quente, acompanhado de pão ou arroz.",
        "ingredients": [
          "1 berinjela",
          "1 abobrinha",
          "2 tomates",
          "1 cebola",
          "2 dentes de alho picados",
          "Azeite",
          "Tomilho e alecrim frescos",
          "Sal e pimenta a gosto"
        ],
        "tags": [
          "Jantar",
          "Ratatouille",
          "Legumes",
          "Refeição saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 220,
        "fats": 8,
        "carbs": 30,
        "proteins": 6
      },
      {
        "id": null,
        "name": "Salmão com Crosta de Gergelim",
        "description": "Um prato elegante e saudável com salmão e crosta de gergelim.",
        "category": "Jantar",
        "image": "https://images.pexels.com/photos/4197508/pexels-photo-4197508.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "35",
        "preparation": "Tempere os filés de salmão com sal, pimenta e suco de limão.\n\nEm um prato, coloque gergelim branco e preto e passe o salmão para que fique coberto com a crosta de gergelim.\n\nEm uma frigideira quente, grelhe os filés de salmão com azeite até ficarem cozidos por completo.\n\nSirva quente, acompanhado de legumes cozidos no vapor.",
        "ingredients": [
          "2 filés de salmão",
          "Suco de 1 limão",
          "Sal e pimenta a gosto",
          "Gergelim branco e preto",
          "Azeite",
          "Legumes variados para acompanhar"
        ],
        "tags": [
          "Jantar",
          "Salmão",
          "Gergelim",
          "Refeição saudável"
        ],
        "difficulty": "Média",
        "servings": 2,
        "isFavorite": true,
        "kcal": 300,
        "fats": 15,
        "carbs": 10,
        "proteins": 25
      },
      {
        "id": null,
        "name": "Wrap de Frango com Abacate",
        "description": "Um wrap delicioso e saudável com frango e abacate.",
        "category": "Jantar",
        "image": "https://images.pexels.com/photos/3728822/pexels-photo-3728822.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "duration": "25",
        "preparation": "Em uma frigideira, grelhe os filés de frango temperados com sal e pimenta.\n\nEm uma tigela, amasse o abacate e misture com suco de limão, alho em pó e coentro.\n\nAqueça as tortilhas de trigo integral.\n\nPara montar os wraps, coloque a mistura de abacate em cada tortilha e adicione os filés de frango grelhados e alface picada.\n\nEnrole bem e sirva.",
        "ingredients": [
          "2 filés de peito de frango",
          "1 abacate maduro",
          "Suco de 1 limão",
          "Alho em pó e coentro a gosto",
          "4 tortilhas de trigo integral",
          "Alface",
          "Sal e pimenta a gosto"
        ],
        "tags": [
          "Jantar",
          "Wrap",
          "Frango",
          "Abacate",
          "Refeição saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 320,
        "fats": 12,
        "carbs": 30,
        "proteins": 20
      },
      {
        "id": null,
        "name": "Suco Verde Detox",
        "description": "Um suco refrescante e saudável para desintoxicar o organismo.",
        "category": "Bebidas",
        "image": "https://images.pexels.com/photos/903167/pexels-photo-903167.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Bata todos os ingredientes no liquidificador e sirva gelado.",
        "ingredients": [
          "2 folhas de couve",
          "1 maçã verde",
          "1 pepino",
          "Suco de 1 limão",
          "Hortelã",
          "Água de coco"
        ],
        "tags": [
          "Suco",
          "Bebida",
          "Detox",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 100,
        "fats": 2,
        "carbs": 20,
        "proteins": 3
      },
      {
        "id": null,
        "name": "Smoothie de Frutas Vermelhas",
        "description": "Um smoothie delicioso e cheio de antioxidantes.",
        "category": "Bebidas",
        "image": "https://images.pexels.com/photos/1392266/pexels-photo-1392266.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Bata todos os ingredientes no liquidificador até obter uma mistura homogênea. Sirva imediatamente.",
        "ingredients": [
          "1 xícara de morangos congelados",
          "1/2 xícara de mirtilos congelados",
          "1/2 xícara de framboesas congeladas",
          "1 banana",
          "Leite vegetal",
          "Mel ou agave (opcional)"
        ],
        "tags": [
          "Smoothie",
          "Bebida",
          "Frutas vermelhas",
          "Antioxidantes"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 150,
        "fats": 2,
        "carbs": 35,
        "proteins": 5
      },
      {
        "id": null,
        "name": "Chá Gelado de Hibisco",
        "description": "Um chá gelado e refrescante feito com flores de hibisco.",
        "category": "Bebidas",
        "image": "https://images.pexels.com/photos/3728939/pexels-photo-3728939.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em uma jarra, adicione as flores de hibisco à água quente e deixe em infusão por alguns minutos. Depois, adicione as folhas de hortelã, o suco de limão e o adoçante, se desejar. Deixe esfriar e sirva com gelo.",
        "ingredients": [
          "2 colheres de sopa de flores de hibisco secas",
          "1 litro de água",
          "Folhas de hortelã",
          "Limão ou laranja (opcional)",
          "Adoçante (opcional)"
        ],
        "tags": [
          "Chá",
          "Bebida",
          "Hibisco",
          "Gelado",
          "Refrescante"
        ],
        "difficulty": "Fácil",
        "servings": 4,
        "isFavorite": true,
        "kcal": 0,
        "fats": 0,
        "carbs": 0,
        "proteins": 0
      },
      {
        "id": null,
        "name": "Smoothie de Abacate e Banana",
        "description": "Um smoothie cremoso e nutritivo.",
        "category": "Bebidas",
        "image": "https://images.pexels.com/photos/2476851/pexels-photo-2476851.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Bata o abacate, a banana e o leite vegetal no liquidificador até obter uma mistura cremosa. Adoce a gosto, se desejar. Sirva imediatamente.",
        "ingredients": [
          "1 abacate maduro",
          "1 banana",
          "Leite vegetal",
          "Mel ou xarope de bordo (opcional)"
        ],
        "tags": [
          "Smoothie",
          "Bebida",
          "Abacate",
          "Banana",
          "Cremoso"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 250,
        "fats": 10,
        "carbs": 35,
        "proteins": 5
      },
      {
        "id": null,
        "name": "Café Gelado com Leite de Amêndoas",
        "description": "Uma bebida gelada e revigorante para os amantes de café.",
        "category": "Bebidas",
        "image": "https://images.pexels.com/photos/1437862/pexels-photo-1437862.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Prepare o café forte e deixe esfriar. Em um copo com gelo, adicione o café e o leite de amêndoas. Adoce a gosto, se desejar.",
        "ingredients": [
          "1 xícara de café forte",
          "1 xícara de leite de amêndoas",
          "Gelo",
          "Xarope de bordo ou açúcar mascavo (opcional)"
        ],
        "tags": [
          "Café",
          "Bebida",
          "Gelado",
          "Leite de amêndoas"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 50,
        "fats": 2,
        "carbs": 8,
        "proteins": 1
      },
      {
        "id": null,
        "name": "Suco de Melancia e Gengibre",
        "description": "Um suco refrescante e hidratante para os dias quentes.",
        "category": "Bebidas",
        "image": "https://images.pexels.com/photos/788456/pexels-photo-788456.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em um liquidificador, bata a melancia até obter um suco. Adicione o suco de limão e o gengibre ralado. Sirva com gelo.",
        "ingredients": [
          "1 fatia grande de melancia",
          "Suco de 1 limão",
          "Gengibre ralado",
          "Água de coco"
        ],
        "tags": [
          "Suco",
          "Bebida",
          "Melancia",
          "Gengibre",
          "Refrescante"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 80,
        "fats": 1,
        "carbs": 20,
        "proteins": 1
      },
      {
        "id": null,
        "name": "Vitamina de Aveia com Banana",
        "description": "Uma vitamina nutritiva e energizante para começar bem o dia.",
        "category": "Bebidas",
        "image": "https://images.pexels.com/photos/2099517/pexels-photo-2099517.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em um liquidificador, bata a banana, a aveia, o leite vegetal e o mel ou agave até ficar cremoso. Sirva imediatamente.",
        "ingredients": [
          "1 banana madura",
          "2 colheres de sopa de aveia",
          "1 xícara de leite vegetal",
          "Mel ou agave (opcional)"
        ],
        "tags": [
          "Vitamina",
          "Bebida",
          "Aveia",
          "Banana",
          "Energizante"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 200,
        "fats": 3,
        "carbs": 35,
        "proteins": 5
      },
      {
        "id": null,
        "name": "Cappuccino Vegano",
        "description": "Uma versão vegana do clássico cappuccino.",
        "category": "Bebidas",
        "image": "https://images.pexels.com/photos/4084815/pexels-photo-4084815.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em uma panela, aqueça o leite vegetal sem deixar ferver. Adicione o café e o açúcar mascavo. Misture bem e despeje a bebida em duas xícaras. Polvilhe canela em cima, se desejar.",
        "ingredients": [
          "1 xícara de leite vegetal",
          "1 xícara de café forte",
          "Açúcar mascavo",
          "Canela em pó (opcional)"
        ],
        "tags": [
          "Cappuccino",
          "Bebida",
          "Vegano",
          "Café"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 80,
        "fats": 2,
        "carbs": 15,
        "proteins": 1
      },
      {
        "id": null,
        "name": "Mojito sem Álcool",
        "description": "Uma versão sem álcool do famoso coquetel de verão.",
        "category": "Bebidas",
        "image": "https://images.pexels.com/photos/2117934/pexels-photo-2117934.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em um copo, macere as folhas de hortelã com o suco de limão e o xarope de bordo. Adicione o suco de lima e a água com gás. Mexa bem e adicione gelo.",
        "ingredients": [
          "8 folhas de hortelã",
          "Suco de 1 limão",
          "2 colheres de sopa de xarope de bordo",
          "Suco de 1 lima",
          "Água com gás",
          "Gelo"
        ],
        "tags": [
          "Mojito",
          "Bebida",
          "Sem álcool",
          "Hortelã"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 50,
        "fats": 0,
        "carbs": 10,
        "proteins": 1
      },
      {
        "id": null,
        "name": "Iced Latte",
        "description": "Um café gelado e cremoso para os dias quentes.",
        "category": "Bebidas",
        "image": "https://images.pexels.com/photos/3626552/pexels-photo-3626552.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em um copo com gelo, despeje o café e o leite vegetal. Adoce a gosto, se desejar. Misture bem e sirva imediatamente.",
        "ingredients": [
          "1 xícara de café forte",
          "1 xícara de leite vegetal",
          "Gelo",
          "Açúcar ou adoçante (opcional)"
        ],
        "tags": [
          "Café",
          "Bebida",
          "Gelado",
          "Latte"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 30,
        "fats": 1,
        "carbs": 5,
        "proteins": 1
      },
      {
        "id": null,
        "name": "Salada Caprese",
        "description": "Uma salada italiana clássica com tomate, mussarela de búfala e manjericão.",
        "category": "Saladas",
        "image": "https://images.pexels.com/photos/282588/pexels-photo-282588.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em um prato, alterne fatias de tomate e mussarela de búfala. Adicione folhas de manjericão e tempere com azeite de oliva, vinagre balsâmico, sal e pimenta.",
        "ingredients": [
          "2 tomates maduros",
          "150g de mussarela de búfala",
          "Folhas de manjericão",
          "Azeite de oliva",
          "Vinagre balsâmico",
          "Sal e pimenta a gosto"
        ],
        "tags": [
          "Salada",
          "Caprese",
          "Italiana",
          "Tomate",
          "Mussarela de búfala"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 200,
        "fats": 15,
        "carbs": 5,
        "proteins": 10
      },
      {
        "id": null,
        "name": "Salada de Quinoa com Legumes",
        "description": "Uma salada nutritiva com quinoa e uma variedade de legumes.",
        "category": "Saladas",
        "image": "https://images.pexels.com/photos/262918/pexels-photo-262918.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Cozinhe a quinoa conforme as instruções da embalagem. Em uma tigela, misture a quinoa cozida com os legumes picados. Tempere com azeite de oliva, suco de limão, sal e pimenta.",
        "ingredients": [
          "1 xícara de quinoa cozida",
          "1 pepino",
          "1 pimentão vermelho",
          "1 cenoura",
          "Tomates cereja",
          "Azeite de oliva",
          "Suco de limão",
          "Sal e pimenta a gosto"
        ],
        "tags": [
          "Salada",
          "Quinoa",
          "Legumes",
          "Saudável",
          "Nutritiva"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 250,
        "fats": 10,
        "carbs": 30,
        "proteins": 8
      },
      {
        "id": null,
        "name": "Salada de Frango com Abacate",
        "description": "Uma salada completa e saborosa com frango e abacate.",
        "category": "Saladas",
        "image": "https://images.pexels.com/photos/3728821/pexels-photo-3728821.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em uma frigideira, grelhe os filés de frango temperados com sal e pimenta. Em um prato, monte a salada com folhas verdes, tomate, abacate e o frango grelhado. Tempere com azeite de oliva e limão.",
        "ingredients": [
          "2 filés de peito de frango",
          "Folhas verdes (alface, rúcula, agrião)",
          "1 tomate",
          "1 abacate",
          "Azeite de oliva",
          "Suco de limão",
          "Sal e pimenta a gosto"
        ],
        "tags": [
          "Salada",
          "Frango",
          "Abacate",
          "Completa",
          "Saborosa"
        ],
        "difficulty": "Média",
        "servings": 2,
        "isFavorite": true,
        "kcal": 300,
        "fats": 15,
        "carbs": 20,
        "proteins": 25
      },
      {
        "id": null,
        "name": "Salada de Grão-de-bico com Tomate Seco",
        "description": "Uma salada saborosa com grão-de-bico e tomate seco.",
        "category": "Saladas",
        "image": "https://images.pexels.com/photos/4889611/pexels-photo-4889611.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Cozinhe o grão-de-bico conforme as instruções da embalagem. Em uma tigela, misture o grão-de-bico cozido com tomate seco picado, folhas verdes e cebola roxa fatiada. Tempere com azeite de oliva, vinagre balsâmico, sal e pimenta.",
        "ingredients": [
          "1 xícara de grão-de-bico cozido",
          "Tomate seco",
          "Folhas verdes (alface, rúcula)",
          "Cebola roxa",
          "Azeite de oliva",
          "Vinagre balsâmico",
          "Sal e pimenta a gosto"
        ],
        "tags": [
          "Salada",
          "Grão-de-bico",
          "Tomate seco",
          "Saborosa",
          "Vegetariana"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 180,
        "fats": 8,
        "carbs": 25,
        "proteins": 10
      },
      {
        "id": null,
        "name": "Salada de Cuscuz Marroquino",
        "description": "Uma salada leve e colorida com cuscuz marroquino e vegetais.",
        "category": "Saladas",
        "image": "https://images.pexels.com/photos/6164044/pexels-photo-6164044.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Prepare o cuscuz marroquino conforme as instruções da embalagem. Em uma tigela, misture o cuscuz com pepino, pimentão, tomate cereja, cebola roxa e salsa. Tempere com azeite de oliva, suco de limão, sal e pimenta.",
        "ingredients": [
          "1 xícara de cuscuz marroquino cozido",
          "1 pepino",
          "1 pimentão",
          "Tomates cereja",
          "Cebola roxa",
          "Salsa",
          "Azeite de oliva",
          "Suco de limão",
          "Sal e pimenta a gosto"
        ],
        "tags": [
          "Salada",
          "Cuscuz marroquino",
          "Colorida",
          "Leve",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 220,
        "fats": 10,
        "carbs": 30,
        "proteins": 5
      },
      {
        "id": null,
        "name": "Salada Caesar Vegana",
        "description": "Uma versão vegana da clássica salada Caesar.",
        "category": "Saladas",
        "image": "https://images.pexels.com/photos/5561478/pexels-photo-5561478.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em uma tigela, misture alface romana picada, croutons, e o molho Caesar vegano. Polvilhe com levedura nutricional e sirva.",
        "ingredients": [
          "Alface romana",
          "Croutons",
          "Levedura nutricional",
          "Molho Caesar vegano"
        ],
        "tags": [
          "Salada",
          "Caesar",
          "Vegana",
          "Sem glúten",
          "Sem laticínios"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 180,
        "fats": 8,
        "carbs": 20,
        "proteins": 5
      },
      {
        "id": null,
        "name": "Salada de Lentilha",
        "description": "Uma salada saudável com lentilha e vegetais.",
        "category": "Saladas",
        "image": "https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Cozinhe a lentilha conforme as instruções da embalagem. Em uma tigela, misture a lentilha cozida com pepino, tomate, cebola roxa e coentro. Tempere com azeite de oliva, suco de limão, sal e pimenta.",
        "ingredients": [
          "1 xícara de lentilha cozida",
          "1 pepino",
          "1 tomate",
          "Cebola roxa",
          "Coentro",
          "Azeite de oliva",
          "Suco de limão",
          "Sal e pimenta a gosto"
        ],
        "tags": [
          "Salada",
          "Lentilha",
          "Saudável",
          "Vegetariana"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 220,
        "fats": 5,
        "carbs": 30,
        "proteins": 10
      },
      {
        "id": null,
        "name": "Salada de Folhas com Morangos",
        "description": "Uma salada refrescante com folhas verdes e morangos.",
        "category": "Saladas",
        "image": "https://images.pexels.com/photos/1049629/pexels-photo-1049629.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em um prato, arrume as folhas verdes, os morangos fatiados e as nozes. Regue com o molho de vinagre balsâmico.",
        "ingredients": [
          "Folhas verdes (rúcula, agrião, alface)",
          "Morangos",
          "Nozes",
          "Molho de vinagre balsâmico"
        ],
        "tags": [
          "Salada",
          "Folhas verdes",
          "Morangos",
          "Refrescante",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 150,
        "fats": 8,
        "carbs": 20,
        "proteins": 5
      },
      {
        "id": null,
        "name": "Salada Grega",
        "description": "Uma salada tradicional grega com pepino, tomate, azeitonas e queijo feta.",
        "category": "Saladas",
        "image": "https://images.pexels.com/photos/207280/pexels-photo-207280.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Corte o pepino, os tomates e a cebola em rodelas. Em um prato, monte a salada com as folhas de alface, os vegetais picados e as azeitonas. Cubra com queijo feta e regue com azeite de oliva e orégano.",
        "ingredients": [
          "1 pepino",
          "2 tomates",
          "1 cebola roxa",
          "Azeitonas pretas",
          "Queijo feta",
          "Folhas de alface",
          "Azeite de oliva",
          "Orégano",
          "Sal e pimenta a gosto"
        ],
        "tags": [
          "Salada",
          "Grega",
          "Mediterrânea",
          "Queijo feta",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 180,
        "fats": 10,
        "carbs": 20,
        "proteins": 6
      },
      {
        "id": null,
        "name": "Salada de Beterraba e Cenoura",
        "description": "Uma salada colorida e nutritiva com beterraba e cenoura.",
        "category": "Saladas",
        "image": "https://images.pexels.com/photos/1626696/pexels-photo-1626696.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Rale a beterraba e a cenoura. Em uma tigela, misture os vegetais ralados com suco de limão, azeite de oliva e coentro picado. Tempere com sal e pimenta.",
        "ingredients": [
          "1 beterraba",
          "2 cenouras",
          "Suco de limão",
          "Azeite de oliva",
          "Coentro picado",
          "Sal e pimenta a gosto"
        ],
        "tags": [
          "Salada",
          "Beterraba",
          "Cenoura",
          "Colorida",
          "Nutritiva"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 120,
        "fats": 5,
        "carbs": 20,
        "proteins": 3
      },
      {
        "id": null,
        "name": "Hambúrguer Vegano",
        "description": "Um delicioso hambúrguer vegano feito com grão-de-bico e legumes.",
        "category": "Vegano",
        "image": "https://images.pexels.com/photos/1170970/pexels-photo-1170970.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em um processador de alimentos, triture o grão-de-bico cozido com cebola, alho, cenoura e temperos. Modele os hambúrgueres e grelhe-os em uma frigideira antiaderente.",
        "ingredients": [
          "1 xícara de grão-de-bico cozido",
          "1 cebola",
          "2 dentes de alho",
          "1 cenoura",
          "Temperos a gosto (cominho, páprica, coentro)",
          "Pão de hambúrguer vegano",
          "Alface, tomate e cebola para acompanhar"
        ],
        "tags": [
          "Vegano",
          "Hambúrguer",
          "Grão-de-bico",
          "Legumes",
          "Saudável"
        ],
        "difficulty": "Média",
        "servings": 2,
        "isFavorite": true,
        "kcal": 250,
        "fats": 8,
        "carbs": 35,
        "proteins": 10
      },
      {
        "id": null,
        "name": "Tofu Mexido",
        "description": "Uma versão vegana do tradicional ovo mexido, feita com tofu.",
        "category": "Vegano",
        "image": "https://images.pexels.com/photos/6163671/pexels-photo-6163671.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em uma frigideira, refogue cebola, pimentão e alho. Acrescente o tofu amassado e tempere com cúrcuma, sal e pimenta. Cozinhe por alguns minutos até ficar bem aquecido.",
        "ingredients": [
          "200g de tofu",
          "1 cebola",
          "1 pimentão",
          "2 dentes de alho",
          "Cúrcuma",
          "Sal e pimenta a gosto",
          "Salsinha picada para finalizar"
        ],
        "tags": [
          "Vegano",
          "Tofu",
          "Ovo mexido",
          "Proteína vegetal",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 180,
        "fats": 10,
        "carbs": 15,
        "proteins": 15
      },
      {
        "id": null,
        "name": "Pizza Vegana",
        "description": "Uma deliciosa pizza vegana feita com massa integral e cobertura de vegetais.",
        "category": "Vegano",
        "image": "https://images.pexels.com/photos/1640775/pexels-photo-1640775.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Prepare a massa de pizza com farinha integral e deixe descansar. Em uma frigideira, refogue os vegetais para a cobertura. Abra a massa, coloque o molho de tomate e a cobertura de vegetais. Asse até a massa ficar crocante.",
        "ingredients": [
          "1 xícara de farinha integral",
          "1/2 xícara de água morna",
          "1 colher de sopa de fermento biológico seco",
          "Molho de tomate vegano",
          "Cobertura de vegetais (pimentão, cebola, cogumelos, azeitonas)",
          "Orégano",
          "Azeite de oliva"
        ],
        "tags": [
          "Vegano",
          "Pizza",
          "Massa integral",
          "Vegetais",
          "Saborosa"
        ],
        "difficulty": "Média",
        "servings": 2,
        "isFavorite": true,
        "kcal": 300,
        "fats": 10,
        "carbs": 40,
        "proteins": 12
      },
      {
        "id": null,
        "name": "Risoto de Cogumelos Vegano",
        "description": "Um risoto cremoso e saboroso feito com cogumelos e leite de coco.",
        "category": "Vegano",
        "image": "https://images.pexels.com/photos/2703464/pexels-photo-2703464.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em uma panela, refogue cebola e alho. Adicione o arroz e os cogumelos picados. Acrescente o leite de coco e o caldo de legumes aos poucos, mexendo sempre até o arroz cozinhar e ficar cremoso.",
        "ingredients": [
          "1 xícara de arroz arbóreo",
          "1 cebola",
          "2 dentes de alho",
          "200g de cogumelos",
          "1 lata de leite de coco",
          "1 litro de caldo de legumes",
          "Azeite de oliva",
          "Salsinha picada para finalizar"
        ],
        "tags": [
          "Vegano",
          "Risoto",
          "Cogumelos",
          "Leite de coco",
          "Cremoso"
        ],
        "difficulty": "Média",
        "servings": 2,
        "isFavorite": true,
        "kcal": 320,
        "fats": 12,
        "carbs": 40,
        "proteins": 8
      },
      {
        "id": null,
        "name": "Espaguete de Abobrinha",
        "description": "Uma opção saudável e vegana de espaguete feito com abobrinha.",
        "category": "Vegano",
        "image": "https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Com um cortador de legumes, faça tiras finas de abobrinha para servir como espaguete. Em uma panela, refogue alho e acrescente o espaguete de abobrinha. Tempere com molho de tomate vegano e sirva quente.",
        "ingredients": [
          "2 abobrinhas",
          "2 dentes de alho",
          "Molho de tomate vegano",
          "Azeite de oliva",
          "Manjericão fresco para finalizar"
        ],
        "tags": [
          "Vegano",
          "Espaguete",
          "Abobrinha",
          "Saudável",
          "Leve"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 150,
        "fats": 6,
        "carbs": 20,
        "proteins": 5
      },
      {
        "id": null,
        "name": "Sopa de Lentilha Vegana",
        "description": "Uma sopa reconfortante e saudável feita com lentilha e vegetais.",
        "category": "Vegano",
        "image": "https://images.pexels.com/photos/1153589/pexels-photo-1153589.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Cozinhe a lentilha conforme as instruções da embalagem. Em uma panela, refogue cebola, alho, cenoura e salsão. Adicione a lentilha cozida, o caldo de legumes e deixe cozinhar até os vegetais ficarem macios.",
        "ingredients": [
          "1 xícara de lentilha",
          "1 cebola",
          "2 dentes de alho",
          "1 cenoura",
          "1 talo de salsão",
          "1 litro de caldo de legumes",
          "Azeite de oliva",
          "Sal e pimenta a gosto"
        ],
        "tags": [
          "Vegano",
          "Sopa",
          "Lentilha",
          "Vegetais",
          "Reconfortante"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 200,
        "fats": 5,
        "carbs": 30,
        "proteins": 10
      },
      {
        "id": null,
        "name": "Rolinhos de Primavera Vegano",
        "description": "Rolinhos de papel de arroz recheados com legumes e tofu.",
        "category": "Vegano",
        "image": "https://images.pexels.com/photos/5938/food-salad-fresh-healthy.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em um prato com água morna, umedeça as folhas de papel de arroz. Coloque os legumes e o tofu no centro de cada folha e enrole como um rolinho. Sirva com molho de amendoim.",
        "ingredients": [
          "Folhas de papel de arroz",
          "Cenoura",
          "Pepino",
          "Tofu",
          "Folhas de hortelã e coentro",
          "Molho de amendoim para servir"
        ],
        "tags": [
          "Vegano",
          "Rolinhos",
          "Primavera",
          "Legumes",
          "Saudável"
        ],
        "difficulty": "Média",
        "servings": 2,
        "isFavorite": true,
        "kcal": 180,
        "fats": 6,
        "carbs": 25,
        "proteins": 8
      },
      {
        "id": null,
        "name": "Tacos Veganos",
        "description": "Tacos recheados com carne de jaca desfiada e guacamole.",
        "category": "Vegano",
        "image": "https://images.pexels.com/photos/3575767/pexels-photo-3575767.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Cozinhe a jaca verde desfiada com temperos como cebola, alho, cominho e páprica. Aqueça as tortilhas de milho e recheie com a carne de jaca, guacamole e folhas verdes.",
        "ingredients": [
          "Carne de jaca verde desfiada",
          "Cebola",
          "Alho",
          "Cominho",
          "Páprica",
          "Tortilhas de milho",
          "Guacamole",
          "Folhas verdes (alface, rúcula)"
        ],
        "tags": [
          "Vegano",
          "Tacos",
          "Jaca",
          "Guacamole",
          "Saboroso"
        ],
        "difficulty": "Média",
        "servings": 2,
        "isFavorite": true,
        "kcal": 280,
        "fats": 12,
        "carbs": 35,
        "proteins": 15
      },
      {
        "id": null,
        "name": "Bowl de Quinoa Vegano",
        "description": "Um bowl saudável e completo com quinoa, legumes e abacate.",
        "category": "Vegano",
        "image": "https://images.pexels.com/photos/6163674/pexels-photo-6163674.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Cozinhe a quinoa conforme as instruções da embalagem. Em uma tigela, misture a quinoa cozida com legumes grelhados, abacate e folhas verdes. Tempere com azeite de oliva, limão, sal e pimenta.",
        "ingredients": [
          "1 xícara de quinoa cozida",
          "Legumes grelhados (pimentão, berinjela, abobrinha)",
          "1 abacate",
          "Folhas verdes (rúcula, agrião)",
          "Azeite de oliva",
          "Suco de limão",
          "Sal e pimenta a gosto"
        ],
        "tags": [
          "Vegano",
          "Bowl",
          "Quinoa",
          "Legumes",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 300,
        "fats": 10,
        "carbs": 40,
        "proteins": 12
      },
      {
        "id": null,
        "name": "Sorvete Vegano de Frutas Vermelhas",
        "description": "Um sorvete cremoso e refrescante feito com frutas vermelhas.",
        "category": "Vegano",
        "image": "https://images.pexels.com/photos/950108/pexels-photo-950108.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em um liquidificador, bata as frutas vermelhas congeladas com leite de coco e adoçante natural. Leve ao freezer para ganhar consistência.",
        "ingredients": [
          "1 xícara de frutas vermelhas congeladas (morango, framboesa, amora)",
          "1 lata de leite de coco",
          "Adoçante natural a gosto (agave, melado, xilitol)",
          "Frutas frescas para decorar (opcional)"
        ],
        "tags": [
          "Vegano",
          "Sorvete",
          "Frutas vermelhas",
          "Refrescante",
          "Sobremesa"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 180,
        "fats": 8,
        "carbs": 25,
        "proteins": 2
      },
      {
        "id": null,
        "name": "Wrap de Frango e Abacate",
        "description": "Um wrap saudável e proteico com frango e abacate.",
        "category": "Lanches",
        "image": "https://images.pexels.com/photos/3728822/pexels-photo-3728822.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em uma frigideira, grelhe os filés de frango temperados com sal e pimenta. Em uma tigela, amasse o abacate e misture com suco de limão, alho em pó e coentro. Aqueça as tortilhas de trigo integral. Para montar os wraps, coloque a mistura de abacate em cada tortilha e adicione os filés de frango grelhados e alface picada. Enrole bem e sirva.",
        "ingredients": [
          "2 filés de peito de frango",
          "1 abacate maduro",
          "Suco de 1 limão",
          "Alho em pó e coentro a gosto",
          "4 tortilhas de trigo integral",
          "Alface",
          "Sal e pimenta a gosto"
        ],
        "tags": [
          "Lanches",
          "Wrap",
          "Frango",
          "Abacate",
          "Fitness",
          "Proteico"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 320,
        "fats": 12,
        "carbs": 30,
        "proteins": 20
      },
      {
        "id": null,
        "name": "Muffins de Banana e Aveia",
        "description": "Muffins saudáveis e energéticos feitos com banana e aveia.",
        "category": "Lanches",
        "image": "https://images.pexels.com/photos/2827185/pexels-photo-2827185.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em um liquidificador, bata bananas maduras com ovos, óleo de coco e leite de amêndoas. Em uma tigela, misture a aveia, a farinha de amêndoas e o fermento. Junte a mistura líquida aos ingredientes secos e despeje em formas de muffin. Asse por 15-20 minutos.",
        "ingredients": [
          "2 bananas maduras",
          "2 ovos",
          "2 colheres de sopa de óleo de coco",
          "1/2 xícara de leite de amêndoas",
          "1 xícara de aveia em flocos",
          "1/2 xícara de farinha de amêndoas",
          "1 colher de chá de fermento em pó"
        ],
        "tags": [
          "Lanches",
          "Muffins",
          "Banana",
          "Aveia",
          "Fitness",
          "Energético"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 180,
        "fats": 8,
        "carbs": 25,
        "proteins": 6
      },
      {
        "id": null,
        "name": "Smoothie Verde",
        "description": "Um smoothie refrescante e cheio de nutrientes verdes.",
        "category": "Lanches",
        "image": "https://images.pexels.com/photos/3327674/pexels-photo-3327674.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "No liquidificador, misture espinafre, couve, pepino, abacaxi, maçã verde, água de coco e gengibre. Bata até ficar homogêneo. Sirva gelado.",
        "ingredients": [
          "1 xícara de espinafre",
          "1 folha de couve",
          "1/2 pepino",
          "1 fatia de abacaxi",
          "1 maçã verde",
          "200ml de água de coco",
          "1 colher de chá de gengibre ralado"
        ],
        "tags": [
          "Lanches",
          "Smoothie",
          "Verde",
          "Fitness",
          "Refrescante",
          "Nutritivo"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 120,
        "fats": 2,
        "carbs": 25,
        "proteins": 5
      },
      {
        "id": null,
        "name": "Cookies de Aveia e Banana",
        "description": "Cookies saudáveis e sem açúcar adicionado feitos com aveia e banana.",
        "category": "Lanches",
        "image": "https://images.pexels.com/photos/2435741/pexels-photo-2435741.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Amasse bananas maduras e misture com aveia em flocos, canela, extrato de baunilha e uvas-passas. Faça bolinhas com a massa e achate-as em uma assadeira. Asse por 15-20 minutos ou até ficarem dourados.",
        "ingredients": [
          "2 bananas maduras",
          "1 e 1/2 xícara de aveia em flocos",
          "1 colher de chá de canela em pó",
          "1 colher de chá de extrato de baunilha",
          "1/4 xícara de uvas-passas"
        ],
        "tags": [
          "Lanches",
          "Cookies",
          "Aveia",
          "Banana",
          "Fitness",
          "Sem açúcar"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 160,
        "fats": 4,
        "carbs": 30,
        "proteins": 3
      },
      {
        "id": null,
        "name": "Iogurte de Coco com Frutas Vermelhas",
        "description": "Um iogurte vegano e refrescante feito com leite de coco e frutas vermelhas.",
        "category": "Lanches",
        "image": "https://images.pexels.com/photos/2827307/pexels-photo-2827307.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Misture o leite de coco com suco de limão e deixe descansar por 10 minutos. Adicione as frutas vermelhas frescas ou congeladas e bata até ficar cremoso. Sirva gelado.",
        "ingredients": [
          "1 lata de leite de coco",
          "Suco de 1 limão",
          "1 xícara de frutas vermelhas frescas ou congeladas"
        ],
        "tags": [
          "Lanches",
          "Iogurte",
          "Coco",
          "Frutas vermelhas",
          "Vegano",
          "Fitness"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 200,
        "fats": 15,
        "carbs": 15,
        "proteins": 2
      },
      {
        "id": null,
        "name": "Barrinhas de Cereais Caseiras",
        "description": "Barrinhas de cereais saudáveis e energéticas para um lanche rápido.",
        "category": "Lanches",
        "image": "https://images.pexels.com/photos/2759152/pexels-photo-2759152.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em uma tigela, misture aveia, tâmaras picadas, amêndoas, coco ralado, sementes de chia e pasta de amendoim. Compacte a mistura em uma forma e leve ao freezer por 1 hora. Corte em barrinhas e armazene em um recipiente hermético.",
        "ingredients": [
          "1 e 1/2 xícara de aveia em flocos",
          "1/2 xícara de tâmaras picadas",
          "1/4 xícara de amêndoas",
          "2 colheres de sopa de coco ralado",
          "2 colheres de sopa de sementes de chia",
          "1/4 xícara de pasta de amendoim"
        ],
        "tags": [
          "Lanches",
          "Barrinhas",
          "Cereais",
          "Energético",
          "Fitness"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 180,
        "fats": 8,
        "carbs": 25,
        "proteins": 5
      },
      {
        "id": null,
        "name": "Pão Integral de Batata Doce",
        "description": "Um pão integral saudável e nutritivo feito com batata doce.",
        "category": "Lanches",
        "image": "https://images.pexels.com/photos/165974/pexels-photo-165974.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em uma tigela, misture a batata doce cozida e amassada, a farinha integral, o fermento, o azeite e a água. Sove a massa e deixe crescer por 1 hora. Asse o pão no forno por cerca de 30 minutos.",
        "ingredients": [
          "1 xícara de batata doce cozida e amassada",
          "2 xícaras de farinha de trigo integral",
          "1 colher de sopa de fermento biológico seco",
          "2 colheres de sopa de azeite de oliva",
          "1/2 xícara de água morna"
        ],
        "tags": [
          "Lanches",
          "Pão",
          "Integral",
          "Batata doce",
          "Fitness",
          "Nutritivo"
        ],
        "difficulty": "Média",
        "servings": 2,
        "isFavorite": true,
        "kcal": 250,
        "fats": 8,
        "carbs": 40,
        "proteins": 6
      },
      {
        "id": null,
        "name": "Omelete de Claras com Vegetais",
        "description": "Uma omelete leve e rica em proteínas com claras de ovos e vegetais.",
        "category": "Lanches",
        "image": "https://images.pexels.com/photos/3885160/pexels-photo-3885160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Bata as claras de ovos com uma pitada de sal. Em uma frigideira antiaderente, coloque as claras batidas e adicione os vegetais picados (pimentão, tomate, cebola, espinafre). Dobre a omelete e cozinhe até ficar dourada.",
        "ingredients": [
          "4 claras de ovos",
          "Pimentão, tomate, cebola e espinafre picados",
          "Sal a gosto"
        ],
        "tags": [
          "Lanches",
          "Omelete",
          "Claras",
          "Vegetais",
          "Fitness",
          "Proteínas"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 120,
        "fats": 2,
        "carbs": 5,
        "proteins": 20
      },
      {
        "id": null,
        "name": "Hummus com Palitos de Vegetais",
        "description": "Uma pasta de grão-de-bico deliciosa servida com palitos de cenoura e pepino.",
        "category": "Lanches",
        "image": "https://images.pexels.com/photos/1351235/pexels-photo-1351235.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em um processador de alimentos, misture grão-de-bico cozido, tahine, suco de limão, alho e azeite. Tempere com sal e pimenta. Sirva o hummus com palitos de cenoura e pepino.",
        "ingredients": [
          "1 lata de grão-de-bico cozido",
          "2 colheres de sopa de tahine",
          "Suco de 1 limão",
          "1 dente de alho",
          "2 colheres de sopa de azeite de oliva",
          "Sal e pimenta a gosto",
          "Palitos de cenoura e pepino para servir"
        ],
        "tags": [
          "Lanches",
          "Hummus",
          "Grão-de-bico",
          "Vegetais",
          "Fitness",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 150,
        "fats": 8,
        "carbs": 15,
        "proteins": 6
      },
      {
        "id": null,
        "name": "Bolinho de Atum com Quinoa",
        "description": "Bolinhos saudáveis e ricos em proteínas feitos com atum e quinoa.",
        "category": "Lanches",
        "image": "https://images.pexels.com/photos/1803191/pexels-photo-1803191.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em uma tigela, misture atum em lata escorrido, quinoa cozida, cebola picada, ovo, farinha de aveia, salsinha e temperos. Molde bolinhos e leve ao forno por 20-25 minutos.",
        "ingredients": [
          "1 lata de atum em água escorrido",
          "1 xícara de quinoa cozida",
          "1/2 cebola picada",
          "1 ovo",
          "2 colheres de sopa de farinha de aveia",
          "2 colheres de sopa de salsinha picada",
          "Sal, pimenta e temperos a gosto"
        ],
        "tags": [
          "Lanches",
          "Bolinho",
          "Atum",
          "Quinoa",
          "Fitness",
          "Proteico"
        ],
        "difficulty": "Média",
        "servings": 2,
        "isFavorite": true,
        "kcal": 180,
        "fats": 6,
        "carbs": 20,
        "proteins": 15
      },
      {
        "id": null,
        "name": "Brownie de Batata Doce",
        "description": "Um brownie saudável e delicioso feito com batata doce.",
        "category": "Doces",
        "image": "https://images.pexels.com/photos/209540/pexels-photo-209540.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em um processador, misture batata doce cozida e amassada, tâmaras, cacau em pó, farinha de aveia e fermento. Coloque a massa em uma forma e leve ao forno por 25-30 minutos.",
        "ingredients": [
          "1 xícara de batata doce cozida e amassada",
          "1/2 xícara de tâmaras sem caroço",
          "1/4 xícara de cacau em pó",
          "1/2 xícara de farinha de aveia",
          "1 colher de chá de fermento em pó"
        ],
        "tags": [
          "Doces",
          "Brownie",
          "Batata doce",
          "Fitness",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 150,
        "fats": 4,
        "carbs": 30,
        "proteins": 3
      },
      {
        "id": null,
        "name": "Cookies de Banana e Aveia",
        "description": "Cookies saudáveis e sem açúcar adicionado feitos com banana e aveia.",
        "category": "Doces",
        "image": "https://images.pexels.com/photos/2549091/pexels-photo-2549091.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Amasse bananas maduras e misture com aveia em flocos, canela, extrato de baunilha e uvas-passas. Faça bolinhas com a massa e achate-as em uma assadeira. Asse por 15-20 minutos ou até ficarem dourados.",
        "ingredients": [
          "2 bananas maduras",
          "1 e 1/2 xícara de aveia em flocos",
          "1 colher de chá de canela em pó",
          "1 colher de chá de extrato de baunilha",
          "1/4 xícara de uvas-passas"
        ],
        "tags": [
          "Doces",
          "Cookies",
          "Banana",
          "Aveia",
          "Fitness",
          "Sem açúcar"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 160,
        "fats": 4,
        "carbs": 30,
        "proteins": 3
      },
      {
        "id": null,
        "name": "Sorvete de Banana e Morango",
        "description": "Um sorvete vegano e refrescante feito com banana e morango.",
        "category": "Doces",
        "image": "https://images.pexels.com/photos/4505526/pexels-photo-4505526.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Congele bananas e morangos cortados em rodelas. Em um processador de alimentos, bata as frutas congeladas até ficar cremoso. Sirva imediatamente.",
        "ingredients": [
          "2 bananas maduras congeladas",
          "1 xícara de morangos congelados"
        ],
        "tags": [
          "Doces",
          "Sorvete",
          "Banana",
          "Morango",
          "Vegano",
          "Fitness"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 120,
        "fats": 1,
        "carbs": 30,
        "proteins": 2
      },
      {
        "id": null,
        "name": "Pudim de Chia e Coco",
        "description": "Um pudim saudável e nutritivo feito com sementes de chia e leite de coco.",
        "category": "Doces",
        "image": "https://images.pexels.com/photos/2246796/pexels-photo-2246796.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em uma tigela, misture leite de coco, sementes de chia, extrato de baunilha e adoçante natural. Deixe descansar na geladeira por pelo menos 2 horas. Sirva gelado.",
        "ingredients": [
          "1 lata de leite de coco",
          "1/4 xícara de sementes de chia",
          "1 colher de chá de extrato de baunilha",
          "Adoçante natural a gosto"
        ],
        "tags": [
          "Doces",
          "Pudim",
          "Chia",
          "Coco",
          "Fitness",
          "Nutritivo"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 180,
        "fats": 10,
        "carbs": 15,
        "proteins": 5
      },
      {
        "id": null,
        "name": "Cocada Fit",
        "description": "Uma versão saudável da cocada tradicional feita com coco e adoçante natural.",
        "category": "Doces",
        "image": "https://images.pexels.com/photos/3727440/pexels-photo-3727440.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em uma panela, misture coco ralado, adoçante natural e água. Leve ao fogo baixo e mexa até a mistura engrossar e ficar homogênea. Deixe esfriar e sirva.",
        "ingredients": [
          "2 xícaras de coco ralado",
          "Adoçante natural a gosto",
          "1/2 xícara de água"
        ],
        "tags": [
          "Doces",
          "Cocada",
          "Coco",
          "Fitness",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 150,
        "fats": 8,
        "carbs": 20,
        "proteins": 2
      },
      {
        "id": null,
        "name": "Panquecas de Aveia e Banana",
        "description": "Panquecas saudáveis e saborosas feitas com aveia e banana.",
        "category": "Doces",
        "image": "https://images.pexels.com/photos/2476856/pexels-photo-2476856.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em um liquidificador, bata bananas maduras com ovos, leite de amêndoas e extrato de baunilha. Em uma tigela, misture aveia, farinha de amêndoas e fermento. Junte a mistura líquida aos ingredientes secos e faça as panquecas em uma frigideira antiaderente.",
        "ingredients": [
          "2 bananas maduras",
          "2 ovos",
          "1/2 xícara de leite de amêndoas",
          "1 colher de chá de extrato de baunilha",
          "1 xícara de aveia em flocos",
          "1/2 xícara de farinha de amêndoas",
          "1 colher de chá de fermento em pó"
        ],
        "tags": [
          "Doces",
          "Panquecas",
          "Aveia",
          "Banana",
          "Fitness",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 180,
        "fats": 6,
        "carbs": 25,
        "proteins": 6
      },
      {
        "id": null,
        "name": "Mousse de Abacate e Cacau",
        "description": "Um mousse cremoso e saudável feito com abacate e cacau.",
        "category": "Doces",
        "image": "https://images.pexels.com/photos/3418033/pexels-photo-3418033.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "No liquidificador, misture abacate maduro, cacau em pó, leite de coco e adoçante natural. Bata até ficar cremoso e leve à geladeira por 1 hora antes de servir.",
        "ingredients": [
          "1 abacate maduro",
          "2 colheres de sopa de cacau em pó",
          "1/2 xícara de leite de coco",
          "Adoçante natural a gosto"
        ],
        "tags": [
          "Doces",
          "Mousse",
          "Abacate",
          "Cacau",
          "Fitness",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 200,
        "fats": 10,
        "carbs": 20,
        "proteins": 3
      },
      {
        "id": null,
        "name": "Torta de Maçã com Aveia",
        "description": "Uma torta doce e saudável feita com maçãs e aveia.",
        "category": "Doces",
        "image": "https://images.pexels.com/photos/1326946/pexels-photo-1326946.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em uma tigela, misture maçãs fatiadas com canela e adoçante natural. Em outra tigela, misture aveia, farinha de amêndoas, óleo de coco e adoçante. Forre uma forma com parte da mistura de aveia, adicione as maçãs e cubra com o restante da mistura. Asse no forno por 25-30 minutos.",
        "ingredients": [
          "2 maçãs fatiadas",
          "1 colher de chá de canela em pó",
          "Adoçante natural a gosto",
          "1 xícara de aveia em flocos",
          "1/2 xícara de farinha de amêndoas",
          "2 colheres de sopa de óleo de coco"
        ],
        "tags": [
          "Doces",
          "Torta",
          "Maçã",
          "Aveia",
          "Fitness",
          "Saudável"
        ],
        "difficulty": "Média",
        "servings": 2,
        "isFavorite": true,
        "kcal": 220,
        "fats": 8,
        "carbs": 30,
        "proteins": 4
      },
      {
        "id": null,
        "name": "Picolé de Frutas",
        "description": "Picolés refrescantes e saudáveis feitos com frutas frescas.",
        "category": "Doces",
        "image": "https://images.pexels.com/photos/1301115/pexels-photo-1301115.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em um liquidificador, bata frutas frescas (manga, morango, kiwi, etc.) com água de coco e adoçante natural. Despeje em formas de picolé e leve ao freezer até congelar.",
        "ingredients": [
          "1 xícara de frutas frescas (manga, morango, kiwi, etc.)",
          "200ml de água de coco",
          "Adoçante natural a gosto"
        ],
        "tags": [
          "Doces",
          "Picolé",
          "Frutas",
          "Fitness",
          "Refrescante"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 100,
        "fats": 1,
        "carbs": 25,
        "proteins": 2
      },
      {
        "id": null,
        "name": "Tapioca com Creme de Ricota e Frutas",
        "description": "Uma tapioca doce e saudável recheada com creme de ricota e frutas.",
        "category": "Doces",
        "image": "https://images.pexels.com/photos/704569/pexels-photo-704569.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        "preparation": "Em uma frigideira, coloque a goma de tapioca e espalhe até formar uma camada uniforme. Deixe cozinhar até a tapioca ficar firme. Em seguida, recheie com creme de ricota e frutas picadas (morango, banana, kiwi, etc.). Dobre ao meio e sirva.",
        "ingredients": [
          "2 colheres de sopa de goma de tapioca",
          "2 colheres de sopa de creme de ricota",
          "Frutas picadas (morango, banana, kiwi, etc.)"
        ],
        "tags": [
          "Doces",
          "Tapioca",
          "Creme de ricota",
          "Frutas",
          "Fitness",
          "Saudável"
        ],
        "difficulty": "Fácil",
        "servings": 2,
        "isFavorite": true,
        "kcal": 150,
        "fats": 4,
        "carbs": 30,
        "proteins": 3
      }
    ];
  }

}