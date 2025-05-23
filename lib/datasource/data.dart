import 'package:slide_team_project/models/college.dart';
import 'package:slide_team_project/models/major.dart';
import 'package:slide_team_project/models/material.dart';

final List<College> colleges = [
  College(
    name: 'Business and Communication',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbty51H2F-Hd3TqAOF6oy5Pk7PvdOjOWdB4Q&s',
    majors: [
      Major(
        name: 'Marketing',
        materials: [
          Material(name: 'Principles of Marketing'),
          Material(name: 'Consumer Behavior'),
        ],
      ),
      Major(
        name: 'Business Administration',
        materials: [
          Material(name: 'Financial Accounting'),
          Material(name: 'Organizational Behavior'),
        ],
      ),
    ],
  ),
  College(
    name: 'Engineering',
    imageUrl: 'https://th.bing.com/th/id/OIP.rN8q3WQD477wmEsWFv8sOgHaEJ?rs=1&pid=ImgDetMain',
    majors: [
      Major(
        name: 'Civil Engineering',
        materials: [
          Material(name: 'Structural Analysis'),
          Material(name: 'Concrete Technology'),
        ],
      ),
      Major(
        name: 'Electrical Engineering',
        materials: [
          Material(name: 'Circuit Theory'),
          Material(name: 'Electromagnetics'),
        ],
      ),
    ],
  ),
  College(
    name: 'Faculty of Medicine',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeEu4U7vzbtyLuGHvm_9xOd--SSan5ytIPXQ&s',
    majors: [
      Major(
        name: 'Medical Laboratory Sciences',
        materials: [
          Material(name: 'Clinical Chemistry'),
          Material(name: 'Hematology'),
        ],
      ),
    ],
  ),
  College(
    name: 'Sharia',
    imageUrl: 'https://scontent.fjrs4-1.fna.fbcdn.net/v/t1.6435-9/72782405_2475441109159744_1690443035432714240_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=833d8c&_nc_ohc=AEHoV-_mSOEQ7kNvwEnRCE_&_nc_oc=AdkZy13NJFQRId65BBn8P-DEbLA4OBNkN9EwmEpccdaKG6xpFV7aiaerMNckgxTTLZ0&_nc_zt=23&_nc_ht=scontent.fjrs4-1.fna&_nc_gid=xB_d1oGmjLWfjvHqE1gWBw&oh=00_AfK6_S7-OCFu8vox3ymF64Sq9gg1vSHeHPE3iFolHoHHuA&oe=684DC616',
    majors: [
      Major(
        name: 'Islamic Studies',
        materials: [
          Material(name: 'Quranic Interpretation'),
          Material(name: 'Hadith Sciences'),
        ],
      ),
    ],
  ),

  College(
    name: 'Humanities',
    imageUrl: 'https://assets.nn.najah.edu/CACHE/images/uploads/weblog/2023/08/01/hum4/8f8e5c0ab8cda899ad6feecccd1314aa.jpg',
    majors: [
      Major(
        name: 'History',
        materials: [
          Material(name: 'World History'),
          Material(name: 'Modern History'),
        ],
      ),
      Major(
        name: 'Education',
        materials: [
          Material(name: 'Educational Psychology'),
          Material(name: 'Curriculum Development'),
        ],
      ),
    ],
  ),
  College(
    name: 'Science',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSH4VwcGe98VDlQWiP6rScDq3z1xOFnPxxRiw&s',
    majors: [
      Major(
        name: 'Biology',
        materials: [
          Material(name: 'Cell Biology'),
          Material(name: 'Genetics'),
        ],
      ),
      Major(
        name: 'Chemistry',
        materials: [
          Material(name: 'Organic Chemistry'),
          Material(name: 'Inorganic Chemistry'),
        ],
      ),
    ],
  ),
  College(
    name: 'Veterinary Medicine and Agricultural Engineering',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNUhp_yGW0P_FzZvkhTNw0Gx7mq3554ratJg&s',
    majors: [
      Major(
        name: 'Veterinary Medicine',
        materials: [
          Material(name: 'Animal Anatomy'),
          Material(name: 'Veterinary Pharmacology'),
        ],
      ),
      Major(
        name: 'Agricultural Engineering',
        materials: [
          Material(name: 'Soil Mechanics'),
          Material(name: 'Irrigation Engineering'),
        ],
      ),
    ],
  ),
  College(
    name: 'Information Technology and Artificial Intelligence',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPfjqAd7vjUaSM68VhpT0_TLEL5D2WCzJIig&s',
    majors: [
      Major(
        name: 'Computer Science',
        materials: [
          Material(name: 'Data Structures'),
          Material(name: 'Algorithms'),
        ],
      ),
      Major(
        name: 'Artificial Intelligence',
        materials: [
          Material(name: 'Machine Learning'),
          Material(name: 'Neural Networks'),
        ],
      ),
    ],
  ),
  College(
    name: 'Law and Political Science',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSJgAorrlBn7g0K8XP-KISserKAO9EhEls-w&s',
    majors: [
      Major(
        name: 'Law',
        materials: [
          Material(name: 'Constitutional Law'),
          Material(name: 'International Law'),
        ],
      ),
      Major(
        name: 'Political Science',
        materials: [
          Material(name: 'Comparative Politics'),
          Material(name: 'Political Theory'),
        ],
      ),
    ],
  ),
  College(
    name: 'Fine Arts',
    imageUrl: 'https://th.bing.com/th/id/OIP.-8baZF8bQAi6scpdDZrn4QHaEJ?rs=1&pid=ImgDetMain',
    majors: [
      Major(
        name: 'Painting',
        materials: [
          Material(name: 'Color Theory'),
          Material(name: 'Drawing Techniques'),
        ],
      ),
      Major(
        name: 'Sculpture',
        materials: [
          Material(name: 'Sculpting Basics'),
          Material(name: 'Material Science'),
        ],
      ),
    ],
  ),
  College(
    name: 'Nursing',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTptSyAJqmtrfTDyEXFV9E0jN4cccalU54NnA&s',
    majors: [
      Major(
        name: 'General Nursing',
        materials: [
          Material(name: 'Anatomy and Physiology'),
          Material(name: 'Patient Care'),
        ],
      ),
    ],
  ),
  College(
    name: 'Pharmacy',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTptSyAJqmtrfTDyEXFV9E0jN4cccalU54NnA&s',
    majors: [
      Major(
        name: 'Pharmaceutical Sciences',
        materials: [
          Material(name: 'Pharmacology'),
          Material(name: 'Medicinal Chemistry'),
        ],
      ),
    ],
  ),
  College(
    name: 'Dentistry and Oral Surgery',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTptSyAJqmtrfTDyEXFV9E0jN4cccalU54NnA&s',
    majors: [
      Major(
        name: 'Dentistry',
        materials: [
          Material(name: 'Oral Anatomy'),
          Material(name: 'Dental Surgery'),
        ],
      ),
    ],
  ),
];
