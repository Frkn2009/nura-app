import '../models/models.dart';

/// A1 travel-first pack. Same 8 scenes in EN / ES / DE / FR / NL.
/// Gloss is provided for every UI language so native-language teaching works.
class Catalog {
  static List<Scenario> forLang(LearnLang lang) =>
      _all.where((s) => s.lang == lang).toList();

  static Scenario? byId(String id) {
    for (final s in _all) {
      if (s.id == id) return s;
    }
    return null;
  }

  static List<Phrase> allPhrases(LearnLang lang) =>
      forLang(lang).expand((s) => s.phrases).toList();

  static final List<Scenario> _all = [
    ..._pack(LearnLang.en, _en),
    ..._pack(LearnLang.es, _es),
    ..._pack(LearnLang.de, _de),
    ..._pack(LearnLang.fr, _fr),
    ..._pack(LearnLang.nl, _nl),
    ..._pack(LearnLang.ar, _ar),
  ];

  static List<Scenario> _pack(LearnLang lang, List<_Raw> raws) {
    return raws.map((r) {
      return Scenario(
        id: '${lang.name}_${r.key}',
        lang: lang,
        cefr: Cefr.a1,
        minutes: r.key == 'airport' ? 8 : 6,
        titles: r.titles,
        clipLine: r.lines.first.$1,
        phrases: [
          for (var i = 0; i < r.lines.length; i++)
            Phrase(
              id: '${lang.name}_${r.key}_$i',
              target: r.lines[i].$1,
              gloss: r.lines[i].$2,
            ),
        ],
        turns: [
          for (final t in r.turns)
            SpeakTurn(prompt: t.$1, expected: t.$2, scaffold: t.$3),
        ],
      );
    }).toList();
  }
}

class _Raw {
  const _Raw(this.key, this.titles, this.lines, this.turns);
  final String key;
  final Map<UiLang, String> titles;
  final List<(String, Map<UiLang, String>)> lines;
  final List<(String, String, String)> turns;
}

Map<UiLang, String> g(String tr, String en, String es, String de, String fr, String nl, [String? ar]) => {
      UiLang.tr: tr,
      UiLang.en: en,
      UiLang.es: es,
      UiLang.de: de,
      UiLang.fr: fr,
      UiLang.nl: nl,
      UiLang.ar: ar ?? en,
    };

final _titlesAirport = g('Havaalanı check-in', 'Airport check-in', 'Facturación', 'Check-in', 'Enregistrement', 'Inchecken');
final _titlesCafe = g('Kafede sipariş', 'Ordering at a café', 'Pedir en un café', 'Im Café bestellen', 'Commander au café', 'Bestellen in een café');
final _titlesHotel = g('Otele giriş', 'Hotel check-in', 'Check-in del hotel', 'Hotel-Check-in', 'Arrivée à l’hôtel', 'Inchecken in het hotel');
final _titlesDir = g('Yol sormak', 'Asking the way', 'Pedir direcciones', 'Nach dem Weg fragen', 'Demander son chemin', 'De weg vragen');
final _titlesShop = g('Markette alışveriş', 'At the market', 'En el mercado', 'Auf dem Markt', 'Au marché', 'Op de markt');
final _titlesHi = g('Tanışmak', 'Introducing yourself', 'Presentarse', 'Sich vorstellen', 'Se présenter', 'Jezelf voorstellen');
final _titlesBill = g('Hesabı istemek', 'Asking for the bill', 'Pedir la cuenta', 'Die Rechnung bitten', 'Demander l’addition', 'Om de rekening vragen');
final _titlesFlat = g('Ev bakmak', 'Viewing a flat', 'Ver un piso', 'Wohnung ansehen', 'Visiter un appart', 'Een woning bekijken');

final _en = <_Raw>[
  _Raw('airport', _titlesAirport, [
    ('I have a reservation.', g('Rezervasyonum var.', 'I have a reservation.', 'Tengo una reserva.', 'Ich habe eine Reservierung.', 'J’ai une réservation.', 'Ik heb een reservering.')),
    ('A window seat, please.', g('Pencere kenarı, lütfen.', 'A window seat, please.', 'Ventanilla, por favor.', 'Ein Fensterplatz, bitte.', 'Côté fenêtre, s’il vous plaît.', 'Een raamstoel, alstublieft.')),
    ('Is this the queue for boarding?', g('Biniş kuyruğu bu mu?', 'Is this the queue for boarding?', '¿Esta es la cola para embarcar?', 'Ist das die Schlange zum Boarding?', 'C’est la file d’embarquement ?', 'Is dit de rij voor boarding?')),
  ], [
    ('The agent greets you. Reply.', 'Hello, I have a reservation.', 'Hello, I have a reservation.'),
    ('They ask: window or aisle?', 'A window seat, please.', 'A window seat, please.'),
  ]),
  _Raw('cafe', _titlesCafe, [
    ('A coffee, please.', g('Bir kahve, lütfen.', 'A coffee, please.', 'Un café, por favor.', 'Einen Kaffee, bitte.', 'Un café, s’il vous plaît.', 'Een koffie, alstublieft.')),
    ('To drink in, please.', g('İçmek için, burada.', 'To drink in, please.', 'Para tomar aquí.', 'Zum Hiertrinken, bitte.', 'Sur place, s’il vous plaît.', 'Hier opdrinken, alstublieft.')),
    ('How much is that?', g('Ne kadar?', 'How much is that?', '¿Cuánto es?', 'Was kostet das?', 'Ça fait combien ?', 'Hoeveel is dat?')),
  ], [
    ('Barista: What can I get you?', 'A coffee, please.', 'A coffee, please.'),
    ('Here or to go?', 'To drink in, please.', 'To drink in, please.'),
  ]),
  _Raw('hotel', _titlesHotel, [
    ('I have a booking under my name.', g('Adıma rezervasyonum var.', 'I have a booking under my name.', 'Tengo una reserva a mi nombre.', 'Ich habe eine Buchung auf meinen Namen.', 'J’ai une réservation à mon nom.', 'Ik heb een boeking op mijn naam.')),
    ('Is breakfast included?', g('Kahvaltı dahil mi?', 'Is breakfast included?', '¿El desayuno está incluido?', 'Ist Frühstück inklusive?', 'Le petit-déjeuner est inclus ?', 'Is het ontbijt inbegrepen?')),
    ('What time is checkout?', g('Çıkış saati ne zaman?', 'What time is checkout?', '¿A qué hora es el check-out?', 'Wann ist der Check-out?', 'C’est à quelle heure le départ ?', 'Hoe laat is de check-out?')),
  ], [
    ('Reception: Good evening.', 'Hello, I have a booking under my name.', 'Hello, I have a booking under my name.'),
    ('Any questions?', 'Is breakfast included?', 'Is breakfast included?'),
  ]),
  _Raw('dir', _titlesDir, [
    ('Excuse me, where is the station?', g('Afedersiniz, istasyon nerede?', 'Excuse me, where is the station?', 'Perdón, ¿dónde está la estación?', 'Entschuldigung, wo ist der Bahnhof?', 'Pardon, où est la gare ?', 'Pardon, waar is het station?')),
    ('Is it far from here?', g('Buradan uzak mı?', 'Is it far from here?', '¿Está lejos de aquí?', 'Ist es weit von hier?', 'C’est loin d’ici ?', 'Is het ver hiervandaan?')),
    ('Thank you very much.', g('Çok teşekkür ederim.', 'Thank you very much.', 'Muchas gracias.', 'Vielen Dank.', 'Merci beaucoup.', 'Hartelijk dank.')),
  ], [
    ('You stop someone politely.', 'Excuse me, where is the station?', 'Excuse me, where is the station?'),
    ('They point. Ask if it is far.', 'Is it far from here?', 'Is it far from here?'),
  ]),
  _Raw('shop', _titlesShop, [
    ('How much does this cost?', g('Bu ne kadar?', 'How much does this cost?', '¿Cuánto cuesta esto?', 'Was kostet das?', 'Ça coûte combien ?', 'Wat kost dit?')),
    ('I’ll take this one.', g('Bunu alayım.', 'I’ll take this one.', 'Me llevo este.', 'Ich nehme das hier.', 'Je prends celui-ci.', 'Deze neem ik.')),
    ('Do you take card?', g('Kart geçerli mi?', 'Do you take card?', '¿Se puede pagar con tarjeta?', 'Kann ich mit Karte zahlen?', 'Vous prenez la carte ?', 'Kan ik pinnen?')),
  ], [
    ('You hold an item.', 'How much does this cost?', 'How much does this cost?'),
    ('You want it.', 'I’ll take this one.', 'I’ll take this one.'),
  ]),
  _Raw('hi', _titlesHi, [
    ('Hi, my name is Deniz.', g('Merhaba, adım Deniz.', 'Hi, my name is Deniz.', 'Hola, me llamo Deniz.', 'Hallo, ich heiße Deniz.', 'Salut, je m’appelle Deniz.', 'Hoi, ik heet Deniz.')),
    ('I am from Turkey.', g('Türkiye’denim.', 'I am from Turkey.', 'Soy de Turquía.', 'Ich komme aus der Türkei.', 'Je viens de Turquie.', 'Ik kom uit Turkije.')),
    ('Nice to meet you.', g('Tanıştığımıza memnun oldum.', 'Nice to meet you.', 'Encantado de conocerte.', 'Freut mich.', 'Enchanté.', 'Leuk je te ontmoeten.')),
  ], [
    ('Someone says hello.', 'Hi, my name is Deniz.', 'Hi, my name is Deniz.'),
    ('Where are you from?', 'I am from Turkey.', 'I am from Turkey.'),
  ]),
  _Raw('bill', _titlesBill, [
    ('Could I get the check, please?', g('Hesabı alabilir miyim?', 'Could I get the check, please?', '¿Me trae la cuenta, por favor?', 'Die Rechnung, bitte.', 'L’addition, s’il vous plaît.', 'Mag ik de rekening, alstublieft?')),
    ('We’d like to pay together.', g('Birlikte ödemek istiyoruz.', 'We’d like to pay together.', 'Queremos pagar juntos.', 'Wir möchten zusammen zahlen.', 'On voudrait payer ensemble.', 'We willen samen betalen.')),
    ('Keep the change.', g('Üstü kalsın.', 'Keep the change.', 'Quédese con el cambio.', 'Stimmt so.', 'Gardez la monnaie.', 'Laat maar zitten.')),
  ], [
    ('You catch the waiter’s eye.', 'Could I get the check, please?', 'Could I get the check, please?'),
    ('Split or together?', 'We’d like to pay together.', 'We’d like to pay together.'),
  ]),
  _Raw('flat', _titlesFlat, [
    ('I am looking for a flat.', g('Daire arıyorum.', 'I am looking for a flat.', 'Estoy buscando un piso.', 'Ich suche eine Wohnung.', 'Je cherche un appartement.', 'Ik zoek een woning.')),
    ('How much is the rent?', g('Kira ne kadar?', 'How much is the rent?', '¿Cuánto es el alquiler?', 'Wie hoch ist die Miete?', 'C’est combien le loyer ?', 'Wat is de huur?')),
    ('When can I move in?', g('Ne zaman taşınabilirim?', 'When can I move in?', '¿Cuándo puedo mudarme?', 'Wann kann ich einziehen?', 'Je peux emménager quand ?', 'Wanneer kan ik erin?')),
  ], [
    ('The agent asks what you need.', 'I am looking for a flat.', 'I am looking for a flat.'),
    ('They show a listing.', 'How much is the rent?', 'How much is the rent?'),
  ]),
];

final _es = <_Raw>[
  _Raw('airport', _titlesAirport, [
    ('Tengo una reserva.', g('Rezervasyonum var.', 'I have a reservation.', 'Tengo una reserva.', 'Ich habe eine Reservierung.', 'J’ai une réservation.', 'Ik heb een reservering.')),
    ('Ventanilla, por favor.', g('Pencere kenarı, lütfen.', 'A window seat, please.', 'Ventanilla, por favor.', 'Ein Fensterplatz, bitte.', 'Côté fenêtre, s’il vous plaît.', 'Een raamstoel, alstublieft.')),
    ('¿Esta es la cola para embarcar?', g('Biniş kuyruğu bu mu?', 'Is this the boarding queue?', '¿Esta es la cola para embarcar?', 'Ist das die Boarding-Schlange?', 'C’est la file d’embarquement ?', 'Is dit de boardingrij?')),
  ], [
    ('El agente te saluda.', 'Hola, tengo una reserva.', 'Hola, tengo una reserva.'),
    ('¿Ventanilla o pasillo?', 'Ventanilla, por favor.', 'Ventanilla, por favor.'),
  ]),
  _Raw('cafe', _titlesCafe, [
    ('Un café, por favor.', g('Bir kahve, lütfen.', 'A coffee, please.', 'Un café, por favor.', 'Einen Kaffee, bitte.', 'Un café, s’il vous plaît.', 'Een koffie, alstublieft.')),
    ('Para tomar aquí.', g('Burada içmek için.', 'To drink in.', 'Para tomar aquí.', 'Zum Hiertrinken.', 'Sur place.', 'Hier opdrinken.')),
    ('¿Cuánto es?', g('Ne kadar?', 'How much is it?', '¿Cuánto es?', 'Was kostet das?', 'Ça fait combien ?', 'Hoeveel is dat?')),
  ], [
    ('¿Qué te pongo?', 'Un café, por favor.', 'Un café, por favor.'),
    ('¿Aquí o para llevar?', 'Para tomar aquí.', 'Para tomar aquí.'),
  ]),
  _Raw('hotel', _titlesHotel, [
    ('Tengo una reserva a mi nombre.', g('Adıma rezervasyonum var.', 'I have a booking under my name.', 'Tengo una reserva a mi nombre.', 'Ich habe eine Buchung auf meinen Namen.', 'J’ai une réservation à mon nom.', 'Ik heb een boeking op mijn naam.')),
    ('¿El desayuno está incluido?', g('Kahvaltı dahil mi?', 'Is breakfast included?', '¿El desayuno está incluido?', 'Ist Frühstück inklusive?', 'Le petit-déjeuner est inclus ?', 'Is het ontbijt inbegrepen?')),
    ('¿A qué hora es el check-out?', g('Çıkış saati ne zaman?', 'What time is checkout?', '¿A qué hora es el check-out?', 'Wann ist Check-out?', 'C’est à quelle heure le départ ?', 'Hoe laat is de check-out?')),
  ], [
    ('Buena tardes.', 'Hola, tengo una reserva a mi nombre.', 'Hola, tengo una reserva a mi nombre.'),
    ('¿Alguna pregunta?', '¿El desayuno está incluido?', '¿El desayuno está incluido?'),
  ]),
  _Raw('dir', _titlesDir, [
    ('Perdón, ¿dónde está la estación?', g('Afedersiniz, istasyon nerede?', 'Excuse me, where is the station?', 'Perdón, ¿dónde está la estación?', 'Entschuldigung, wo ist der Bahnhof?', 'Pardon, où est la gare ?', 'Pardon, waar is het station?')),
    ('¿Está lejos de aquí?', g('Buradan uzak mı?', 'Is it far?', '¿Está lejos de aquí?', 'Ist es weit?', 'C’est loin ?', 'Is het ver?')),
    ('Muchas gracias.', g('Çok teşekkürler.', 'Thank you very much.', 'Muchas gracias.', 'Vielen Dank.', 'Merci beaucoup.', 'Hartelijk dank.')),
  ], [
    ('Paras a alguien.', 'Perdón, ¿dónde está la estación?', 'Perdón, ¿dónde está la estación?'),
    ('Te señalan. Pregunta si está lejos.', '¿Está lejos de aquí?', '¿Está lejos de aquí?'),
  ]),
  _Raw('shop', _titlesShop, [
    ('¿Cuánto cuesta esto?', g('Bu ne kadar?', 'How much is this?', '¿Cuánto cuesta esto?', 'Was kostet das?', 'Ça coûte combien ?', 'Wat kost dit?')),
    ('Me llevo este.', g('Bunu alıyorum.', 'I’ll take this one.', 'Me llevo este.', 'Ich nehme das.', 'Je prends celui-ci.', 'Deze neem ik.')),
    ('¿Se puede pagar con tarjeta?', g('Kartla ödenebilir mi?', 'Can I pay by card?', '¿Se puede pagar con tarjeta?', 'Kartenzahlung möglich?', 'Vous prenez la carte ?', 'Kan ik pinnen?')),
  ], [
    ('Tomas algo en la mano.', '¿Cuánto cuesta esto?', '¿Cuánto cuesta esto?'),
    ('Lo quieres.', 'Me llevo este.', 'Me llevo este.'),
  ]),
  _Raw('hi', _titlesHi, [
    ('Hola, me llamo Deniz.', g('Merhaba, adım Deniz.', 'Hi, my name is Deniz.', 'Hola, me llamo Deniz.', 'Hallo, ich heiße Deniz.', 'Salut, je m’appelle Deniz.', 'Hoi, ik heet Deniz.')),
    ('Soy de Turquía.', g('Türkiye’denim.', 'I am from Turkey.', 'Soy de Turquía.', 'Ich komme aus der Türkei.', 'Je viens de Turquie.', 'Ik kom uit Turkije.')),
    ('Encantado de conocerte.', g('Tanıştığımıza memnun oldum.', 'Nice to meet you.', 'Encantado de conocerte.', 'Freut mich.', 'Enchanté.', 'Leuk je te ontmoeten.')),
  ], [
    ('Alguien te saluda.', 'Hola, me llamo Deniz.', 'Hola, me llamo Deniz.'),
    ('¿De dónde eres?', 'Soy de Turquía.', 'Soy de Turquía.'),
  ]),
  _Raw('bill', _titlesBill, [
    ('¿Me trae la cuenta, por favor?', g('Hesabı getirir misiniz?', 'Could I get the check?', '¿Me trae la cuenta, por favor?', 'Die Rechnung, bitte.', 'L’addition, s’il vous plaît.', 'Mag ik de rekening?')),
    ('Queremos pagar juntos.', g('Birlikte ödemek istiyoruz.', 'We want to pay together.', 'Queremos pagar juntos.', 'Wir möchten zusammen zahlen.', 'On voudrait payer ensemble.', 'We willen samen betalen.')),
    ('Quédese con el cambio.', g('Üstü kalsın.', 'Keep the change.', 'Quédese con el cambio.', 'Stimmt so.', 'Gardez la monnaie.', 'Laat maar zitten.')),
  ], [
    ('Llamas al camarero.', '¿Me trae la cuenta, por favor?', '¿Me trae la cuenta, por favor?'),
    ('¿Juntos o por separado?', 'Queremos pagar juntos.', 'Queremos pagar juntos.'),
  ]),
  _Raw('flat', _titlesFlat, [
    ('Estoy buscando un piso.', g('Daire arıyorum.', 'I am looking for a flat.', 'Estoy buscando un piso.', 'Ich suche eine Wohnung.', 'Je cherche un appartement.', 'Ik zoek een woning.')),
    ('¿Cuánto es el alquiler?', g('Kira ne kadar?', 'How much is the rent?', '¿Cuánto es el alquiler?', 'Wie hoch ist die Miete?', 'C’est combien le loyer ?', 'Wat is de huur?')),
    ('¿Cuándo puedo mudarme?', g('Ne zaman taşınabilirim?', 'When can I move in?', '¿Cuándo puedo mudarme?', 'Wann kann ich einziehen?', 'Je peux emménager quand ?', 'Wanneer kan ik erin?')),
  ], [
    ('El agente pregunta qué buscas.', 'Estoy buscando un piso.', 'Estoy buscando un piso.'),
    ('Te enseña un anuncio.', '¿Cuánto es el alquiler?', '¿Cuánto es el alquiler?'),
  ]),
  _Raw(
    'nie',
    g('NIE / kayıt', 'NIE / registration', 'NIE y empadronamiento', 'NIE / Anmeldung', 'NIE / enregistrement', 'NIE / inschrijving'),
    [
      ('Quiero solicitar el NIE.', g('NIE başvurusu yapmak istiyorum.', 'I want to apply for the NIE.', 'Quiero solicitar el NIE.', 'Ich möchte die NIE beantragen.', 'Je veux demander le NIE.', 'Ik wil de NIE aanvragen.')),
      ('Necesito empadronarme.', g('Belediyeye kayıt olmam lazım.', 'I need to register at the town hall.', 'Necesito empadronarme.', 'Ich muss mich anmelden.', 'Je dois m’inscrire à la mairie.', 'Ik moet me inschrijven.')),
      ('¿Qué documentos necesito?', g('Hangi evraklar lazım?', 'What documents do I need?', '¿Qué documentos necesito?', 'Welche Unterlagen brauche ich?', 'Quels documents faut-il ?', 'Welke documenten heb ik nodig?')),
    ],
    [
      ('En extranjería te preguntan.', 'Quiero solicitar el NIE.', 'Quiero solicitar el NIE.'),
      ('Te piden papeles.', '¿Qué documentos necesito?', '¿Qué documentos necesito?'),
    ],
  ),
  _Raw(
    'contrato',
    g('Kira sözleşmesi', 'Rental contract', 'Contrato de alquiler', 'Mietvertrag', 'Contrat de location', 'Huurcontract'),
    [
      ('¿La fianza es de un mes?', g('Depozito bir aylık mı?', 'Is the deposit one month?', '¿La fianza es de un mes?', 'Ist die Kaution ein Monat?', 'La caution est d’un mois ?', 'Is de borg één maand?')),
      ('¿Incluye agua y luz?', g('Su ve elektrik dahil mi?', 'Does it include water and electricity?', '¿Incluye agua y luz?', 'Sind Wasser und Strom inklusive?', 'Ça inclut l’eau et l’électricité ?', 'Zit water en stroom erbij?')),
      ('Quiero leer el contrato.', g('Sözleşmeyi okumak istiyorum.', 'I want to read the contract.', 'Quiero leer el contrato.', 'Ich möchte den Vertrag lesen.', 'Je veux lire le contrat.', 'Ik wil het contract lezen.')),
    ],
    [
      ('El casero habla de dinero.', '¿La fianza es de un mes?', '¿La fianza es de un mes?'),
      ('Te da papeles.', 'Quiero leer el contrato.', 'Quiero leer el contrato.'),
    ],
  ),
];

final _de = <_Raw>[
  _Raw('airport', _titlesAirport, [
    ('Ich habe eine Reservierung.', g('Rezervasyonum var.', 'I have a reservation.', 'Tengo una reserva.', 'Ich habe eine Reservierung.', 'J’ai une réservation.', 'Ik heb een reservering.')),
    ('Ein Fensterplatz, bitte.', g('Pencere kenarı, lütfen.', 'A window seat, please.', 'Ventanilla, por favor.', 'Ein Fensterplatz, bitte.', 'Côté fenêtre, s’il vous plaît.', 'Een raamstoel, alstublieft.')),
    ('Ist das die Schlange zum Boarding?', g('Biniş kuyruğu bu mu?', 'Is this the boarding queue?', '¿Esta es la cola para embarcar?', 'Ist das die Schlange zum Boarding?', 'C’est la file d’embarquement ?', 'Is dit de boardingrij?')),
  ], [
    ('Der Schalter begrüßt dich.', 'Hallo, ich habe eine Reservierung.', 'Hallo, ich habe eine Reservierung.'),
    ('Fenster oder Gang?', 'Ein Fensterplatz, bitte.', 'Ein Fensterplatz, bitte.'),
  ]),
  _Raw('cafe', _titlesCafe, [
    ('Einen Kaffee, bitte.', g('Bir kahve, lütfen.', 'A coffee, please.', 'Un café, por favor.', 'Einen Kaffee, bitte.', 'Un café, s’il vous plaît.', 'Een koffie, alstublieft.')),
    ('Zum Hiertrinken, bitte.', g('Burada içmek için.', 'To drink in.', 'Para tomar aquí.', 'Zum Hiertrinken, bitte.', 'Sur place.', 'Hier opdrinken.')),
    ('Was kostet das?', g('Ne kadar?', 'How much is that?', '¿Cuánto es?', 'Was kostet das?', 'Ça fait combien ?', 'Hoeveel is dat?')),
  ], [
    ('Was darf es sein?', 'Einen Kaffee, bitte.', 'Einen Kaffee, bitte.'),
    ('Hier oder mitnehmen?', 'Zum Hiertrinken, bitte.', 'Zum Hiertrinken, bitte.'),
  ]),
  _Raw('hotel', _titlesHotel, [
    ('Ich habe eine Buchung auf meinen Namen.', g('Adıma rezervasyonum var.', 'I have a booking under my name.', 'Tengo una reserva a mi nombre.', 'Ich habe eine Buchung auf meinen Namen.', 'J’ai une réservation à mon nom.', 'Ik heb een boeking op mijn naam.')),
    ('Ist Frühstück inklusive?', g('Kahvaltı dahil mi?', 'Is breakfast included?', '¿El desayuno está incluido?', 'Ist Frühstück inklusive?', 'Le petit-déjeuner est inclus ?', 'Is het ontbijt inbegrepen?')),
    ('Wann ist der Check-out?', g('Çıkış saati ne zaman?', 'What time is checkout?', '¿A qué hora es el check-out?', 'Wann ist der Check-out?', 'C’est à quelle heure le départ ?', 'Hoe laat is de check-out?')),
  ], [
    ('Guten Abend.', 'Hallo, ich habe eine Buchung auf meinen Namen.', 'Hallo, ich habe eine Buchung auf meinen Namen.'),
    ('Noch Fragen?', 'Ist Frühstück inklusive?', 'Ist Frühstück inklusive?'),
  ]),
  _Raw('dir', _titlesDir, [
    ('Entschuldigung, wo ist der Bahnhof?', g('Afedersiniz, istasyon nerede?', 'Excuse me, where is the station?', 'Perdón, ¿dónde está la estación?', 'Entschuldigung, wo ist der Bahnhof?', 'Pardon, où est la gare ?', 'Pardon, waar is het station?')),
    ('Ist es weit von hier?', g('Buradan uzak mı?', 'Is it far?', '¿Está lejos?', 'Ist es weit von hier?', 'C’est loin ?', 'Is het ver?')),
    ('Vielen Dank.', g('Çok teşekkürler.', 'Thank you.', 'Muchas gracias.', 'Vielen Dank.', 'Merci beaucoup.', 'Dank u wel.')),
  ], [
    ('Du sprichst jemanden an.', 'Entschuldigung, wo ist der Bahnhof?', 'Entschuldigung, wo ist der Bahnhof?'),
    ('Man zeigt. Frage, ob es weit ist.', 'Ist es weit von hier?', 'Ist es weit von hier?'),
  ]),
  _Raw('shop', _titlesShop, [
    ('Was kostet das?', g('Bu ne kadar?', 'How much is this?', '¿Cuánto cuesta esto?', 'Was kostet das?', 'Ça coûte combien ?', 'Wat kost dit?')),
    ('Ich nehme das hier.', g('Bunu alıyorum.', 'I’ll take this.', 'Me llevo este.', 'Ich nehme das hier.', 'Je prends celui-ci.', 'Deze neem ik.')),
    ('Kann ich mit Karte zahlen?', g('Kartla ödeyebilir miyim?', 'Can I pay by card?', '¿Con tarjeta?', 'Kann ich mit Karte zahlen?', 'Vous prenez la carte ?', 'Kan ik pinnen?')),
  ], [
    ('Du hältst etwas.', 'Was kostet das?', 'Was kostet das?'),
    ('Du willst es.', 'Ich nehme das hier.', 'Ich nehme das hier.'),
  ]),
  _Raw('hi', _titlesHi, [
    ('Hallo, ich heiße Deniz.', g('Merhaba, adım Deniz.', 'Hi, I am Deniz.', 'Hola, me llamo Deniz.', 'Hallo, ich heiße Deniz.', 'Salut, je m’appelle Deniz.', 'Hoi, ik heet Deniz.')),
    ('Ich komme aus der Türkei.', g('Türkiye’denim.', 'I am from Turkey.', 'Soy de Turquía.', 'Ich komme aus der Türkei.', 'Je viens de Turquie.', 'Ik kom uit Turkije.')),
    ('Freut mich.', g('Memnun oldum.', 'Nice to meet you.', 'Encantado.', 'Freut mich.', 'Enchanté.', 'Leuk je te ontmoeten.')),
  ], [
    ('Jemand sagt hallo.', 'Hallo, ich heiße Deniz.', 'Hallo, ich heiße Deniz.'),
    ('Woher kommst du?', 'Ich komme aus der Türkei.', 'Ich komme aus der Türkei.'),
  ]),
  _Raw('bill', _titlesBill, [
    ('Die Rechnung, bitte.', g('Hesap, lütfen.', 'The bill, please.', 'La cuenta, por favor.', 'Die Rechnung, bitte.', 'L’addition, s’il vous plaît.', 'De rekening, alstublieft.')),
    ('Wir möchten zusammen zahlen.', g('Birlikte ödemek istiyoruz.', 'We want to pay together.', 'Queremos pagar juntos.', 'Wir möchten zusammen zahlen.', 'On voudrait payer ensemble.', 'We willen samen betalen.')),
    ('Stimmt so.', g('Üstü kalsın.', 'Keep the change.', 'Quédese con el cambio.', 'Stimmt so.', 'Gardez la monnaie.', 'Laat maar zitten.')),
  ], [
    ('Du winkst dem Kellner.', 'Die Rechnung, bitte.', 'Die Rechnung, bitte.'),
    ('Zusammen oder getrennt?', 'Wir möchten zusammen zahlen.', 'Wir möchten zusammen zahlen.'),
  ]),
  _Raw('flat', _titlesFlat, [
    ('Ich suche eine Wohnung.', g('Daire arıyorum.', 'I am looking for a flat.', 'Busco un piso.', 'Ich suche eine Wohnung.', 'Je cherche un appartement.', 'Ik zoek een woning.')),
    ('Wie hoch ist die Miete?', g('Kira ne kadar?', 'How much is the rent?', '¿Cuánto es el alquiler?', 'Wie hoch ist die Miete?', 'C’est combien le loyer ?', 'Wat is de huur?')),
    ('Wann kann ich einziehen?', g('Ne zaman taşınabilirim?', 'When can I move in?', '¿Cuándo puedo mudarme?', 'Wann kann ich einziehen?', 'Je peux emménager quand ?', 'Wanneer kan ik erin?')),
  ], [
    ('Der Makler fragt.', 'Ich suche eine Wohnung.', 'Ich suche eine Wohnung.'),
    ('Er zeigt ein Inserat.', 'Wie hoch ist die Miete?', 'Wie hoch ist die Miete?'),
  ]),
];

final _fr = <_Raw>[
  _Raw('airport', _titlesAirport, [
    ('J’ai une réservation.', g('Rezervasyonum var.', 'I have a reservation.', 'Tengo una reserva.', 'Ich habe eine Reservierung.', 'J’ai une réservation.', 'Ik heb een reservering.')),
    ('Côté fenêtre, s’il vous plaît.', g('Pencere kenarı, lütfen.', 'A window seat, please.', 'Ventanilla, por favor.', 'Ein Fensterplatz, bitte.', 'Côté fenêtre, s’il vous plaît.', 'Een raamstoel, alstublieft.')),
    ('C’est la file d’embarquement ?', g('Biniş kuyruğu bu mu?', 'Is this the boarding queue?', '¿La cola para embarcar?', 'Die Boarding-Schlange?', 'C’est la file d’embarquement ?', 'Is dit de boardingrij?')),
  ], [
    ('L’agent vous salue.', 'Bonjour, j’ai une réservation.', 'Bonjour, j’ai une réservation.'),
    ('Hublot ou couloir ?', 'Côté fenêtre, s’il vous plaît.', 'Côté fenêtre, s’il vous plaît.'),
  ]),
  _Raw('cafe', _titlesCafe, [
    ('Un café, s’il vous plaît.', g('Bir kahve, lütfen.', 'A coffee, please.', 'Un café, por favor.', 'Einen Kaffee, bitte.', 'Un café, s’il vous plaît.', 'Een koffie, alstublieft.')),
    ('Sur place, s’il vous plaît.', g('Burada içmek için.', 'To drink in.', 'Para tomar aquí.', 'Zum Hiertrinken.', 'Sur place, s’il vous plaît.', 'Hier opdrinken.')),
    ('Ça fait combien ?', g('Ne kadar?', 'How much is it?', '¿Cuánto es?', 'Was kostet das?', 'Ça fait combien ?', 'Hoeveel is dat?')),
  ], [
    ('Je vous écoute.', 'Un café, s’il vous plaît.', 'Un café, s’il vous plaît.'),
    ('Sur place ou à emporter ?', 'Sur place, s’il vous plaît.', 'Sur place, s’il vous plaît.'),
  ]),
  _Raw('hotel', _titlesHotel, [
    ('J’ai une réservation à mon nom.', g('Adıma rezervasyonum var.', 'I have a booking under my name.', 'Tengo una reserva a mi nombre.', 'Ich habe eine Buchung auf meinen Namen.', 'J’ai une réservation à mon nom.', 'Ik heb een boeking op mijn naam.')),
    ('Le petit-déjeuner est inclus ?', g('Kahvaltı dahil mi?', 'Is breakfast included?', '¿Desayuno incluido?', 'Frühstück inklusive?', 'Le petit-déjeuner est inclus ?', 'Is het ontbijt inbegrepen?')),
    ('C’est à quelle heure le départ ?', g('Çıkış saati?', 'What time is checkout?', '¿Hora de check-out?', 'Wann ist Check-out?', 'C’est à quelle heure le départ ?', 'Hoe laat is de check-out?')),
  ], [
    ('Bonsoir.', 'Bonjour, j’ai une réservation à mon nom.', 'Bonjour, j’ai une réservation à mon nom.'),
    ('Une question ?', 'Le petit-déjeuner est inclus ?', 'Le petit-déjeuner est inclus ?'),
  ]),
  _Raw('dir', _titlesDir, [
    ('Pardon, où est la gare ?', g('Afedersiniz, istasyon nerede?', 'Excuse me, where is the station?', '¿Dónde está la estación?', 'Wo ist der Bahnhof?', 'Pardon, où est la gare ?', 'Waar is het station?')),
    ('C’est loin d’ici ?', g('Uzak mı?', 'Is it far?', '¿Está lejos?', 'Ist es weit?', 'C’est loin d’ici ?', 'Is het ver?')),
    ('Merci beaucoup.', g('Çok teşekkürler.', 'Thank you.', 'Gracias.', 'Danke.', 'Merci beaucoup.', 'Dank je wel.')),
  ], [
    ('Vous arrêtez quelqu’un.', 'Pardon, où est la gare ?', 'Pardon, où est la gare ?'),
    ('On montre. Demandez si c’est loin.', 'C’est loin d’ici ?', 'C’est loin d’ici ?'),
  ]),
  _Raw('shop', _titlesShop, [
    ('Ça coûte combien ?', g('Ne kadar?', 'How much is this?', '¿Cuánto cuesta?', 'Was kostet das?', 'Ça coûte combien ?', 'Wat kost dit?')),
    ('Je prends celui-ci.', g('Bunu alıyorum.', 'I’ll take this one.', 'Me llevo este.', 'Ich nehme das.', 'Je prends celui-ci.', 'Deze neem ik.')),
    ('Vous prenez la carte ?', g('Kart geçerli mi?', 'Do you take card?', '¿Tarjeta?', 'Karte?', 'Vous prenez la carte ?', 'Pinnen?')),
  ], [
    ('Vous tenez un objet.', 'Ça coûte combien ?', 'Ça coûte combien ?'),
    ('Vous le voulez.', 'Je prends celui-ci.', 'Je prends celui-ci.'),
  ]),
  _Raw('hi', _titlesHi, [
    ('Salut, je m’appelle Deniz.', g('Merhaba, adım Deniz.', 'Hi, I am Deniz.', 'Hola, me llamo Deniz.', 'Hallo, ich heiße Deniz.', 'Salut, je m’appelle Deniz.', 'Hoi, ik heet Deniz.')),
    ('Je viens de Turquie.', g('Türkiye’denim.', 'I am from Turkey.', 'Soy de Turquía.', 'Ich komme aus der Türkei.', 'Je viens de Turquie.', 'Ik kom uit Turkije.')),
    ('Enchanté.', g('Memnun oldum.', 'Nice to meet you.', 'Encantado.', 'Freut mich.', 'Enchanté.', 'Aangenaam.')),
  ], [
    ('On vous dit bonjour.', 'Salut, je m’appelle Deniz.', 'Salut, je m’appelle Deniz.'),
    ('Tu viens d’où ?', 'Je viens de Turquie.', 'Je viens de Turquie.'),
  ]),
  _Raw('bill', _titlesBill, [
    ('L’addition, s’il vous plaît.', g('Hesap, lütfen.', 'The bill, please.', 'La cuenta, por favor.', 'Die Rechnung, bitte.', 'L’addition, s’il vous plaît.', 'De rekening, alstublieft.')),
    ('On voudrait payer ensemble.', g('Birlikte ödemek istiyoruz.', 'We want to pay together.', 'Queremos pagar juntos.', 'Zusammen zahlen.', 'On voudrait payer ensemble.', 'Samen betalen.')),
    ('Gardez la monnaie.', g('Üstü kalsın.', 'Keep the change.', 'Quédese con el cambio.', 'Stimmt so.', 'Gardez la monnaie.', 'Laat maar zitten.')),
  ], [
    ('Vous appelez le serveur.', 'L’addition, s’il vous plaît.', 'L’addition, s’il vous plaît.'),
    ('Ensemble ou séparément ?', 'On voudrait payer ensemble.', 'On voudrait payer ensemble.'),
  ]),
  _Raw('flat', _titlesFlat, [
    ('Je cherche un appartement.', g('Daire arıyorum.', 'I am looking for a flat.', 'Busco un piso.', 'Ich suche eine Wohnung.', 'Je cherche un appartement.', 'Ik zoek een woning.')),
    ('C’est combien le loyer ?', g('Kira ne kadar?', 'How much is the rent?', '¿Cuánto es el alquiler?', 'Wie hoch ist die Miete?', 'C’est combien le loyer ?', 'Wat is de huur?')),
    ('Je peux emménager quand ?', g('Ne zaman taşınabilirim?', 'When can I move in?', '¿Cuándo puedo mudarme?', 'Wann einziehen?', 'Je peux emménager quand ?', 'Wanneer kan ik erin?')),
  ], [
    ('L’agent demande.', 'Je cherche un appartement.', 'Je cherche un appartement.'),
    ('Il montre une annonce.', 'C’est combien le loyer ?', 'C’est combien le loyer ?'),
  ]),
];

final _nl = <_Raw>[
  _Raw('airport', _titlesAirport, [
    ('Ik heb een reservering.', g('Rezervasyonum var.', 'I have a reservation.', 'Tengo una reserva.', 'Ich habe eine Reservierung.', 'J’ai une réservation.', 'Ik heb een reservering.')),
    ('Een raamstoel, alstublieft.', g('Pencere kenarı, lütfen.', 'A window seat, please.', 'Ventanilla, por favor.', 'Ein Fensterplatz, bitte.', 'Côté fenêtre, s’il vous plaît.', 'Een raamstoel, alstublieft.')),
    ('Is dit de rij voor boarding?', g('Biniş kuyruğu bu mu?', 'Is this the boarding queue?', '¿La cola para embarcar?', 'Die Boarding-Schlange?', 'La file d’embarquement ?', 'Is dit de rij voor boarding?')),
  ], [
    ('De medewerker groet je.', 'Hallo, ik heb een reservering.', 'Hallo, ik heb een reservering.'),
    ('Raam of pad?', 'Een raamstoel, alstublieft.', 'Een raamstoel, alstublieft.'),
  ]),
  _Raw('cafe', _titlesCafe, [
    ('Een koffie, alstublieft.', g('Bir kahve, lütfen.', 'A coffee, please.', 'Un café, por favor.', 'Einen Kaffee, bitte.', 'Un café, s’il vous plaît.', 'Een koffie, alstublieft.')),
    ('Hier opdrinken, alstublieft.', g('Burada içmek için.', 'To drink in.', 'Para tomar aquí.', 'Zum Hiertrinken.', 'Sur place.', 'Hier opdrinken, alstublieft.')),
    ('Hoeveel is dat?', g('Ne kadar?', 'How much is that?', '¿Cuánto es?', 'Was kostet das?', 'Ça fait combien ?', 'Hoeveel is dat?')),
  ], [
    ('Wat mag het zijn?', 'Een koffie, alstublieft.', 'Een koffie, alstublieft.'),
    ('Hier of meenemen?', 'Hier opdrinken, alstublieft.', 'Hier opdrinken, alstublieft.'),
  ]),
  _Raw('hotel', _titlesHotel, [
    ('Ik heb een boeking op mijn naam.', g('Adıma rezervasyonum var.', 'I have a booking under my name.', 'Tengo una reserva a mi nombre.', 'Ich habe eine Buchung auf meinen Namen.', 'J’ai une réservation à mon nom.', 'Ik heb een boeking op mijn naam.')),
    ('Is het ontbijt inbegrepen?', g('Kahvaltı dahil mi?', 'Is breakfast included?', '¿Desayuno incluido?', 'Frühstück inklusive?', 'Petit-déjeuner inclus ?', 'Is het ontbijt inbegrepen?')),
    ('Hoe laat is de check-out?', g('Çıkış saati?', 'What time is checkout?', '¿Hora de check-out?', 'Wann Check-out?', 'Heure du départ ?', 'Hoe laat is de check-out?')),
  ], [
    ('Goedenavond.', 'Hallo, ik heb een boeking op mijn naam.', 'Hallo, ik heb een boeking op mijn naam.'),
    ('Nog vragen?', 'Is het ontbijt inbegrepen?', 'Is het ontbijt inbegrepen?'),
  ]),
  _Raw('dir', _titlesDir, [
    ('Pardon, waar is het station?', g('Afedersiniz, istasyon nerede?', 'Excuse me, where is the station?', '¿Dónde está la estación?', 'Wo ist der Bahnhof?', 'Où est la gare ?', 'Pardon, waar is het station?')),
    ('Is het ver hiervandaan?', g('Uzak mı?', 'Is it far?', '¿Está lejos?', 'Ist es weit?', 'C’est loin ?', 'Is het ver hiervandaan?')),
    ('Hartelijk dank.', g('Çok teşekkürler.', 'Thank you.', 'Gracias.', 'Danke.', 'Merci.', 'Hartelijk dank.')),
  ], [
    ('Je spreekt iemand aan.', 'Pardon, waar is het station?', 'Pardon, waar is het station?'),
    ('Ze wijzen. Vraag of het ver is.', 'Is het ver hiervandaan?', 'Is het ver hiervandaan?'),
  ]),
  _Raw('shop', _titlesShop, [
    ('Wat kost dit?', g('Bu ne kadar?', 'How much is this?', '¿Cuánto cuesta?', 'Was kostet das?', 'Ça coûte combien ?', 'Wat kost dit?')),
    ('Deze neem ik.', g('Bunu alıyorum.', 'I’ll take this.', 'Me llevo este.', 'Ich nehme das.', 'Je prends celui-ci.', 'Deze neem ik.')),
    ('Kan ik pinnen?', g('Kartla ödeyebilir miyim?', 'Can I pay by card?', '¿Con tarjeta?', 'Mit Karte?', 'La carte ?', 'Kan ik pinnen?')),
  ], [
    ('Je houdt iets vast.', 'Wat kost dit?', 'Wat kost dit?'),
    ('Je wilt het.', 'Deze neem ik.', 'Deze neem ik.'),
  ]),
  _Raw('hi', _titlesHi, [
    ('Hoi, ik heet Deniz.', g('Merhaba, adım Deniz.', 'Hi, I am Deniz.', 'Hola, me llamo Deniz.', 'Hallo, ich heiße Deniz.', 'Salut, je m’appelle Deniz.', 'Hoi, ik heet Deniz.')),
    ('Ik kom uit Turkije.', g('Türkiye’denim.', 'I am from Turkey.', 'Soy de Turquía.', 'Ich komme aus der Türkei.', 'Je viens de Turquie.', 'Ik kom uit Turkije.')),
    ('Leuk je te ontmoeten.', g('Tanıştığımıza memnun oldum.', 'Nice to meet you.', 'Encantado.', 'Freut mich.', 'Enchanté.', 'Leuk je te ontmoeten.')),
  ], [
    ('Iemand zegt hoi.', 'Hoi, ik heet Deniz.', 'Hoi, ik heet Deniz.'),
    ('Waar kom je vandaan?', 'Ik kom uit Turkije.', 'Ik kom uit Turkije.'),
  ]),
  _Raw('bill', _titlesBill, [
    ('Mag ik de rekening, alstublieft?', g('Hesabı alabilir miyim?', 'Could I get the bill?', '¿La cuenta?', 'Die Rechnung?', 'L’addition ?', 'Mag ik de rekening, alstublieft?')),
    ('We willen samen betalen.', g('Birlikte ödemek istiyoruz.', 'We want to pay together.', 'Queremos pagar juntos.', 'Zusammen zahlen.', 'Payer ensemble.', 'We willen samen betalen.')),
    ('Laat maar zitten.', g('Üstü kalsın.', 'Keep the change.', 'Quédese con el cambio.', 'Stimmt so.', 'Gardez la monnaie.', 'Laat maar zitten.')),
  ], [
    ('Je roept de ober.', 'Mag ik de rekening, alstublieft?', 'Mag ik de rekening, alstublieft?'),
    ('Samen of apart?', 'We willen samen betalen.', 'We willen samen betalen.'),
  ]),
  _Raw('flat', _titlesFlat, [
    ('Ik zoek een woning.', g('Daire arıyorum.', 'I am looking for a flat.', 'Busco un piso.', 'Ich suche eine Wohnung.', 'Je cherche un appartement.', 'Ik zoek een woning.')),
    ('Wat is de huur?', g('Kira ne kadar?', 'How much is the rent?', '¿Cuánto es el alquiler?', 'Wie hoch ist die Miete?', 'C’est combien le loyer ?', 'Wat is de huur?')),
    ('Wanneer kan ik erin?', g('Ne zaman taşınabilirim?', 'When can I move in?', '¿Cuándo puedo mudarme?', 'Wann einziehen?', 'Emménager quand ?', 'Wanneer kan ik erin?')),
  ], [
    ('De makelaar vraagt.', 'Ik zoek een woning.', 'Ik zoek een woning.'),
    ('Hij toont een advertentie.', 'Wat is de huur?', 'Wat is de huur?'),
  ]),
];
