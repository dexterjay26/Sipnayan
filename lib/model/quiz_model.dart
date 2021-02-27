class QuizModel {
  final question;
  final answer;
  final List<String> choices;

  QuizModel({
    this.question,
    this.answer,
    this.choices,
  });
}

List get getFractionQuestionSet {
  return _fractionQuestionSet;
}

List get getArithmeticQuestionSet {
  return _arithmeticQuestionSet;
}

List get getProblemSolvingQuestionSet {
  return _problemSolvingQuestionSet;
}

//data
const List _fractionQuestionSet = [
  {
    "1": "What is 10/20 + 5/20?",
    "2": "What is 1/8 + 3/8?",
    "3": "Which is equal to 1/4?",
    "4": "Which of the following is greater than 1/2?",
    "5": "Which of the following is less than 3/4?",
    "6": "The following fractions are greater than ½ except:",
    "7": "What is the difference of 3/5 and 1/5?",
    "8": "What is the lowest term of 25/50?",
    "9": "What is the sum of 5/10 and 3/10?",
    "10": "Multiply 2/5 from 4/5.",
    "11": "Find the difference of 5/15 and 4/15.",
    "12": "What is 2/5 ÷ 4/10?",
    "13":
        "The sum of 2/5 and 1/5 is 3/5, which is not the equivalent value of the answer?",
    "14":
        "15/7 is an example of improper fraction, which of the following is the mixed number of the given fraction?",
    "15": "What is 9/15 multiply to 5/10?",
    "16": "Subtract 7/20 to 4/20",
    "17": "1/5 is the equivalent of:",
    "18": "What is the sum of 2/5 and 9/10?",
    "19": "Divide 6/9 to 3/9.",
    "20": "What is the difference when 9/10 is subtracted to 3/5?"
  },
  {
    "1": {
      "a": "1/4",
      "b": "3/4",
      "c": "10/20",
      "d": "12/20",
    },
    "2": {
      "a": "3/4",
      "b": "1/2",
      "c": "2/4",
      "d": "1/8",
    },
    "3": {
      "a": "2/10",
      "b": "4/6",
      "c": "2/8",
      "d": "2/4",
    },
    "4": {
      "a": "2/3",
      "b": "3/8",
      "c": "6/12",
      "d": "4/8",
    },
    "5": {
      "a": "2/3",
      "b": "9/12",
      "c": "6/7",
      "d": "7/8",
    },
    "6": {
      "a": "4/7",
      "b": "3/5",
      "c": "2/5",
      "d": "2/3",
    },
    "7": {
      "a": "1/5",
      "b": "2/5",
      "c": "3/5",
      "d": "4/5",
    },
    "8": {
      "a": "5/10",
      "b": "2/5",
      "c": "1/2",
      "d": "10/25",
    },
    "9": {
      "a": "8/10",
      "b": "2/5",
      "c": "4/10",
      "d": "4/5",
    },
    "10": {
      "a": "8/25",
      "b": "8/5",
      "c": "2/25",
      "d": "2/5",
    },
    "11": {
      "a": "1",
      "b": "1/5",
      "c": "4/15",
      "d": "9/15",
    },
    "12": {
      "a": "3",
      "b": "7",
      "c": "2/4",
      "d": "1",
    },
    "13": {
      "a": "6/10",
      "b": "9/15",
      "c": "12/15",
      "d": "15/25",
    },
    "14": {
      "a": "2 1/7",
      "b": "1 2/7",
      "c": "2 2/7",
      "d": "2 3/7",
    },
    "15": {
      "a": "1/25",
      "b": "6/10",
      "c": "3/10",
      "d": "2/10",
    },
    "16": {
      "a": "3/10",
      "b": "3/5",
      "c": "3/6",
      "d": "3/20",
    },
    "17": {
      "a": "2/10",
      "b": "3/10",
      "c": "4/10",
      "d": "6/10",
    },
    "18": {
      "a": "13/10",
      "b": "11/10",
      "c": "12/15",
      "d": "11/15",
    },
    "19": {
      "a": "1",
      "b": "2",
      "c": "3",
      "d": "2/3",
    },
    "20": {
      "a": "3/10",
      "b": "2/10",
      "c": "1/10",
      "d": "6/10",
    },
  },
  {
    "1": "3/4",
    "2": "1/2",
    "3": "2/8",
    "4": "2/3",
    "5": "2/3",
    "6": "2/5",
    "7": "2/5",
    "8": "1/2",
    "9": "4/5",
    "10": "8/25",
    "11": "1/15",
    "12": "1",
    "13": "12/15",
    "14": "2 1/7",
    "15": "3/10",
    "16": "3/20",
    "17": "2/10",
    "18": "13/10",
    "19": "2",
    "20": "3/10",
  }
];

const List _arithmeticQuestionSet = [
  {
    "1": "18 - 4 x 2 = __________",
    "2": "3 + 9 × 4 – 8 + 35 = _____________",
    "3": "What would be my first step? 7+ 4 x 6 - 8 is equal to _________.",
    "4": "16 + 5 x 9 - 3 = __________",
    "5": "8 x 7 ÷ 4 + 17 - 5", // 3
    "6": "6 x 9 ÷ 3 = ________ ",
    "7": "26 + 2 x 5 = ________",
    "8": "Solve 4 x 5 ÷ 2 + 16 - 8.", // 2
    "9": "What is 10 + 6 x 9 + 28?", // 1
    "10": "10 - 6 + 5 × 10 ÷ 5 = _________",
    "11": "25 ÷ 5 + 9 x 2 = _________",
    "12": "(24 ÷ 3) (16 ÷ 4) is equal to _________.",
    "13": "(12 × 10) - 81 ÷ 9 + 8 is equal to ______.",
    "14": "78 + 6 x 3 - 10 ÷ 5 = ________",
    "15": "30 ÷ 5 + 9 x 2 -8 = ________",
    "16": "(27 ÷ 3) (36 ÷ 4)= _________",
    "17": "12 × 2 - 81 ÷ 9 + 8 = _________",
    "18": "64 + 6 x 8 - 10 ÷ 5= ________",
    "19": "(9 × 10) - 54 ÷ 9 + 8 is equal to _________.",
    "20": "(15 × 7) - 72 ÷ 9 + 8 = ________",
  },
  {
    "1": {
      "a": "10",
      "b": "18",
      "c": "6",
      "d": "28",
    },
    "2": {
      "a": "68",
      "b": "50",
      "c": "66",
      "d": "70",
    },
    "3": {
      "a": "addition",
      "b": "multiplication",
      "c": "subtraction",
      "d": "exponents",
    },
    "4": {
      "a": "43",
      "b": "47",
      "c": "50",
      "d": "58",
    },
    "5": { // 3
      "a": "36",
      "b": "32",
      "c": "61",
      "d": "26",
    },
    "6": {
      "a": "17",
      "b": "21",
      "c": "18",
      "d": "20",
    },
    "7": {
      "a": "32",
      "b": "36",
      "c": "38",
      "d": "34",
    },
    "8": { // 2
      "a": "18",
      "b": "20",
      "c": "15",
      "d": "25",
    },
    "9": { // 1
      "a": "82",
      "b": "92",
      "c": "95",
      "d": "91",
    },
    "10": {
      "a": "14",
      "b": "10",
      "c": "13",
      "d": "17",
    },
    "11": {
      "a": "29",
      "b": "23",
      "c": "27",
      "d": "25",
    },
    "12": {
      "a": "35",
      "b": "37",
      "c": "32",
      "d": "33",
    },
    "13": {
      "a": "119",
      "b": "114",
      "c": "117",
      "d": "120",
    },
    "14": {
      "a": "96",
      "b": "98",
      "c": "100",
      "d": "94",
    },
    "15": {
      "a": "20",
      "b": "17",
      "c": "18",
      "d": "16",
    },
    "16": {
      "a": "81",
      "b": "86",
      "c": "95",
      "d": "90",
    },
    "17": {
      "a": "23",
      "b": "24",
      "c": "20",
      "d": "28",
    },
    "18": {
      "a": "100",
      "b": "110",
      "c": "105",
      "d": "113",
    },
    "19": {
      "a": "85",
      "b": "89",
      "c": "95",
      "d": "92",
    },
    "20": {
      "a": "110",
      "b": "109",
      "c": "105",
      "d": "103",
    },
  },
  {
    "1": "10",
    "2": "66",
    "3": "multiplication",
    "4": "58",
    "5": "26",
    "6": "18",
    "7": "36",
    "8": "18",
    "9": "92",
    "10": "14",
    "11": "23",
    "12": "32",
    "13": "119",
    "14": "94",
    "15": "16",
    "16": "81",
    "17": "23",
    "18": "110",
    "19": "92",
    "20": "105",
  }
];

const List _problemSolvingQuestionSet = [
  {
    "1":
        "Jamine has 17 lemon sweets and 18 orange sweets. What is the total number of sweets Jamine has?",
    "2":
        "The boys had 3 weeks to sell tickets for their play. In the first week, they sold 82 tickets. In the second week they sold 212 tickets and in the third week they sold 301 tickets. How many tickets did they sell in all?",
    "3":
        "Mr. Smith spent \$450 for petrol on Wednesday. He spent \$125 more than that on Thursday. How much did he spend on petrol on those two days?",
    "4":
        "In Senior High school department there are 458 boys and 524 girls. How many students are there in Senior High school department?",
    "5":
        "Avi got Php200 from her father and Php289 from her mother. How much money does she have now?",
    "6":
        "There are 51 lions and 67 tigers in the zoo. These are the only wild animals in the zoo. Find the total number of wild animals in the zoo.",
    "7":
        "In a call center company, 233 calls are made before noon and 417 calls are made after noon. How many calls receive in that day?",
    "8":
        "An old comic book shops have 8721 old DVDs and 5001new DVDs. What is the total number of DVDs in the shop?",
    "9":
        "In a grand theatre performance, 73 men and 115 women participated. What is the total number of participants?",
    "10":
        "A famous dictionary contains 200 pages. A new version includes 135 more pages. What is the total number of pages in a new version?",
    "11":
        "Mr.Barb donates Php5, 109 by check for a school fun run. The amount in his account is Php276, 308. What will be the balance in his account once the check is released?",
    "12":
        "Gemma bought a brand new car for Php30,723. The estimated value of the car after 6 years is \$17,990. If she sells the car after 6 years, by how much less money would she have?",
    "13":
        "The average distance from earth to the sun is 92, 589, 230 miles. The distance from earth to the moon is 92,350,373 miles less than the distance from earth to the sun. What is the distance from earth to the moon?",
    "14":
        "Zeus needs at least 5000 points to go to level 2 in a video game. He has only 2810 points in level 1. How many more points does he need to qualify for level 2?",
    "15":
        "A medical camp was conducted in China. 1854 males participated in the camp. The entry book shows 4100 people participated in the camp. How many females participated?",
    "16":
        "Hannah has a book which contains 921 pages. She has already read 495 pages. How many pages are unread?",
    "17":
        "Director Cathy Molina directed a film which ran for 320 minutes. During the editing process, 151 minutes were removed. What is the final running time of the film, after editing?",
    "18":
        "An animal care society tested 400 pet animals. 127 were infected by diseases. How many pet animals is not infected by diseases participated in medical test?",
    "19":
        "An egg seller bought 240 eggs and sold 148 eggs. How many eggs were left unsold?",
    "20":
        "In a district level competition in journalism, 823 students participated. 423 students of them were boys. How many girls participated?",
  },
  {
    "1": {
      "a": "29",
      "b": "33",
      "c": "35",
      "d": "31",
    },
    "2": {
      "a": "595",
      "b": "599",
      "c": "695",
      "d": "583",
    },
    "3": {
      "a": "1,025",
      "b": "575",
      "c": "1,225",
      "d": "545",
    },
    "4": {
      "a": "991",
      "b": "982",
      "c": "972",
      "d": "981",
    },
    "5": {
      "a": "469",
      "b": "479",
      "c": "499",
      "d": "489",
    },
    "6": {
      "a": "110",
      "b": "116",
      "c": "118",
      "d": "120",
    },
    "7": {
      "a": "672",
      "b": "666",
      "c": "650",
      "d": "645",
    },
    "8": {
      "a": "13,722",
      "b": "13,767",
      "c": "13,873",
      "d": "13,999",
    },
    "9": {
      "a": "199",
      "b": "168",
      "c": "188",
      "d": "166",
    },
    "10": {
      "a": "335",
      "b": "325",
      "c": "330",
      "d": "300",
    },
    "11": {
      "a": "275,129",
      "b": "266,879",
      "c": "284,289",
      "d": "271,199",
    },
    "12": {
      "a": "12,933",
      "b": "12,733",
      "c": "12,333",
      "d": "12,833",
    },
    "13": {
      "a": "238,857",
      "b": "222,876",
      "c": "219,990",
      "d": "265.099",
    },
    "14": {
      "a": "2,990",
      "b": "2,190",
      "c": "2,390",
      "d": "2,280",
    },
    "15": {
      "a": "2.026",
      "b": "2,336",
      "c": "2,246",
      "d": "2,776",
    },
    "16": {
      "a": "456",
      "b": "466",
      "c": "426",
      "d": "416",
    },
    "17": {
      "a": "169",
      "b": "199",
      "c": "189",
      "d": "289",
    },
    "18": {
      "a": "283",
      "b": "273",
      "c": "223",
      "d": "293",
    },
    "19": {
      "a": "92",
      "b": "82",
      "c": "72",
      "d": "85",
    },
    "20": {
      "a": "412",
      "b": "400",
      "c": "512",
      "d": "500",
    },
  },
  {
    "1": "35",
    "2": "595",
    "3": "1,025",
    "4": "982",
    "5": "489",
    "6": "118",
    "7": "650",
    "8": "13,722",
    "9": "188",
    "10": "335",
    "11": "271,199",
    "12": "12,733",
    "13": "238,857",
    "14": "2,190",
    "15": "2,246",
    "16": "426",
    "17": "169",
    "18": "273",
    "19": "92",
    "20": "400",
  }
];
