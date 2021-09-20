import 'dart:convert';

FaqModel faqModelFromJson(String str) => FaqModel.fromJson(json.decode(str));

String faqModelToJson(FaqModel data) => json.encode(data.toJson());

class FaqModel {
    FaqModel({
        this.success,
        this.faqs,
    });

    bool success;
    List<Faq> faqs;

    factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
        success: json["success"],
        faqs: List<Faq>.from(json["faqs"].map((x) => Faq.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "faqs": List<dynamic>.from(faqs.map((x) => x.toJson())),
    };
}

class Faq {
    Faq({
        this.id,
        this.question,
        this.answer,
        this.createdAt,
        this.updatedAt,
    });

    String id;
    String question;
    String answer;
    DateTime createdAt;
    DateTime updatedAt;

    factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        id: json["_id"],
        question: json["question"],
        answer: json["answer"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "question": question,
        "answer": answer,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
