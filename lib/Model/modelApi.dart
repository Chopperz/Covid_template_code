class CovidModelData {
  // * ตัวแปร
  int? deaths;
  int? newConfirmed;
  int? newRecovered;
  int? newDeaths;

  // ? นำตัวแปรเข้ามาในคลาสเพื่อใช้งาน
  CovidModelData({
    this.deaths,
    this.newConfirmed,
    this.newRecovered,
    this.newDeaths,
  });

  // ทำการแปลงค่า field จาก Json ที่ได้รับมาจาก service
  factory CovidModelData.fromJson(Map<String, dynamic> json) {
    return CovidModelData(
      deaths: json["Deaths"],
      newConfirmed: json["NewConfirmed"],
      newRecovered: json["NewRecovered"],
      newDeaths: json["NewDeaths"],
    );
  }
}
