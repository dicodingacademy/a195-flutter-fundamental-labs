// todo-01-init-01: create a dicoding class
class DicodingCourse {
  final String title;
  final String description;

  DicodingCourse({
    required this.title,
    required this.description,
  });
}

// todo-01-init-02: add a list of dicoding class based on learning path
final List<DicodingCourse> androidPath = [
  DicodingCourse(
    title: 'Memulai Pemrograman Dengan Kotlin',
    description:
        'Langkah pertama untuk menjadi seorang Android Developer dengan mempelajari bahasa yang direkomendasikan oleh Google.',
  ),
  DicodingCourse(
    title: 'Belajar Membuat Aplikasi Android untuk Pemula',
    description:
        'Buat aplikasi pertamamu dengan memahami dasar-dasar membuat tampilan dan logika aplikasi.',
  ),
  DicodingCourse(
    title: 'Belajar Fundamental Aplikasi Android',
    description:
        'Perdalam keahlianmu di dunia pemrograman Android dengan mempelajari cara membuat aplikasi yang dapat mengambil data dari server dan menyimpannya ke dalam database.',
  ),
  DicodingCourse(
    title: 'Belajar Pengembangan Aplikasi Android Intermediate',
    description:
        'Perdalam keahlian untuk menjadi Associate Android Developer yang fokus pada pengalaman pengguna yang lebih baik.',
  ),
  DicodingCourse(
    title: 'Belajar Prinsip Pemrograman SOLID',
    description:
        'Memperkaya modal menjadi Android Developer dengan belajar prinsip dasar SOLID.',
  ),
  DicodingCourse(
    title: 'Menjadi Android Developer Expert',
    description:
        'Jadilah developer expert dengan belajar berbagai macam skill yang diperlukan di dunia industri, termasuk performa dan keamanan aplikasi.',
  ),
];

final List<DicodingCourse> iosPath = [
  DicodingCourse(
    title: 'Memulai Pemrograman Dengan Swift',
    description:
        'Langkah pertama untuk menjadi seorang iOS Developer dengan mempelajari bahasa yang direkomendasikan oleh Apple.Inc.',
  ),
  DicodingCourse(
    title: 'Belajar Membuat Aplikasi iOS untuk Pemula',
    description:
        'Buat aplikasi iOS pertamamu dengan memahami dasar-dasar membuat tampilan dan logika aplikasi.',
  ),
  DicodingCourse(
    title: 'Belajar Fundamental Aplikasi iOS',
    description:
        'Perdalam keahlianmu di dunia pemrograman iOS dengan mempelajari cara membuat aplikasi yang dapat mengambil data dari server dan menyimpannya ke dalam database.',
  ),
  DicodingCourse(
    title: 'Belajar Prinsip Pemrograman SOLID',
    description:
        'Memperkaya modal menjadi iOS Developer dengan belajar prinsip dasar SOLID.',
  ),
  DicodingCourse(
    title: 'Menjadi iOS Developer Expert',
    description:
        'Jadilah iOS Developer Expert dengan belajar berbagai macam skill yang diperlukan di dunia industri.',
  ),
];

final List<DicodingCourse> multiplatformPath = [
  DicodingCourse(
    title: 'Memulai Pemrograman Dengan Dart',
    description:
        'Langkah pertama untuk menjadi seorang Flutter Developer dengan mempelajari bahasa Dart yang digunakan untuk mengembangkan aplikasi dengan Flutter.',
  ),
  DicodingCourse(
    title: 'Belajar Membuat Aplikasi Flutter untuk Pemula',
    description:
        'Buat aplikasi pertamamu dengan mengenal Flutter dan memahami dasar-dasar membangun tampilan Flutter dengan widget.',
  ),
  DicodingCourse(
    title: 'Belajar Fundamental Aplikasi Flutter',
    description:
        'Perdalam keahlianmu dalam mengembangkan aplikasi menggunakan Flutter dengan mempelajari cara membuat aplikasi yang dapat mengambil data dari server dan menyimpannya ke dalam database.',
  ),
  DicodingCourse(
    title: 'Belajar Pengembangan Aplikasi Flutter Intermediate',
    description:
        'Memperkaya widget dan fungsionalitas Flutter untuk menunjang aplikasi yang lebih fleksibel. ',
  ),
  DicodingCourse(
    title: 'Belajar Prinsip Pemrograman SOLID',
    description:
        'Mendalami Object-Oriented Programming (OOP) dengan belajar prinsip dasar SOLID.',
  ),
  DicodingCourse(
    title: 'Menjadi Flutter Developer Expert',
    description:
        'Pelajari best practice seperti clean architecture, TDD, modularisasi, continuous integration, performance, dan security dalam mengembangkan aplikasi Flutter.',
  ),
];

final List<DicodingCourse> webPath = [
  DicodingCourse(
    title: 'Belajar Dasar Pemrograman Web',
    description:
        'Belajar dasar adalah langkah yang tidak boleh dilewatkan untuk mahir di bidang apa pun. Di sini, Anda akan belajar dasar dari HTML, CSS dan JavaScript. sebagai 3 pilar pembentuk website.',
  ),
  DicodingCourse(
    title: 'Belajar Dasar Pemrograman JavaScript',
    description:
        'Kuasai JavaScript sebagai bahasa pemrograman populer, mulai dari fundamental, sintaks dan fitur ES6, hingga konsep automation test menggunakan framework ternama.',
  ),
  DicodingCourse(
    title: 'Belajar Membuat Front-End Web untuk Pemula',
    description:
        'Seorang Front-End Web Developer harus mahir menggunakan JavaScript agar mampu membuat website yang interaktif. Di langkah ini, Anda akan belajar banyak tentang JavaScript untuk membuat websitemu menarik.',
  ),
  DicodingCourse(
    title: 'Belajar Fundamental Front-End Web Development',
    description:
        'Agar pengalaman mengembangkan website lebih seru, gunakanlah tools modern seperti Webpack. Selain itu, Anda akan belajar bagaimana menampilkan data dari server sehingga webmu bisa menampilkan data yang dinamis.',
  ),
  DicodingCourse(
    title: 'Belajar Tools Front-End Web Intermediate',
    description:
        'Persiapkan skill-mu sebagai langkah awal untuk memasuki dunia industri dengan mempelajari tools untuk meningkatkan kualitas aplikasi web kamu. Di langkah ini, kamu akan mempelajari tools yang banyak digunakan di industri.',
  ),
  DicodingCourse(
    title: 'Menjadi Front-End Web Developer Expert',
    description:
        'Menjadi seorang expert adalah impian setiap developer. Untuk itu, Anda perlu mempelajari prinsip dan materi expert seperti testing dan performance di sini. Di langkah ini juga, Anda diarahkan untuk membuat web aplikasi yang modern.',
  ),
];
