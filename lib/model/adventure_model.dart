class AdventureModel {
  late int count;
  int offset = 0;
  late List<Data> data;

  AdventureModel(
      {required this.count, required this.data, required this.offset});

  AdventureModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? pk;
  String? status;
  String? title;
  AreaLocation? areaLocation;
  AreaLocation? startingLocation;
  List<String>? tags;
  String? activity;
  int? activityId;
  String? primaryImage;
  String? primaryVideo;
  String? thumbnail;
  String? activityIcon;
  List<Badges>? badges;
  int? bucketListCount;
  List<Contents>? contents;
  SupplyInfo? supplyInfo;
  List<GridInfo>? gridInfo;
  bool? ticketOptional;
  String? primaryDescription;
  String? description;
  List<Facts>? facts;

  Data(
      {this.id,
      this.pk,
      this.status,
      this.title,
      this.areaLocation,
      this.startingLocation,
      this.tags,
      this.activity,
      this.activityId,
      this.primaryImage,
      this.primaryVideo,
      this.thumbnail,
      this.activityIcon,
      this.badges,
      this.bucketListCount,
      this.contents,
      this.supplyInfo,
      this.gridInfo,
      this.ticketOptional,
      this.primaryDescription,
      this.description,
      this.facts});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pk = json['pk'];
    status = json['status'];
    title = json['title'];
    areaLocation = json['area_location'] != null
        ? new AreaLocation.fromJson(json['area_location'])
        : null;
    startingLocation = json['starting_location'] != null
        ? new AreaLocation.fromJson(json['starting_location'])
        : null;
    tags = json['tags'].cast<String>();
    activity = json['activity'];
    activityId = json['activity_id'];
    primaryImage = json['primary_image'];
    primaryVideo = json['primary_video'];
    thumbnail = json['thumbnail'];
    activityIcon = json['activity_icon'];
    if (json['badges'] != null) {
      badges = <Badges>[];
      json['badges'].forEach((v) {
        badges!.add(new Badges.fromJson(v));
      });
    }
    bucketListCount = json['bucket_list_count'];
    if (json['contents'] != null) {
      contents = <Contents>[];
      json['contents'].forEach((v) {
        contents!.add(new Contents.fromJson(v));
      });
    }
    supplyInfo = json['supply_info'] != null
        ? new SupplyInfo.fromJson(json['supply_info'])
        : null;
    if (json['grid_info'] != null) {
      gridInfo = <GridInfo>[];
      json['grid_info'].forEach((v) {
        gridInfo!.add(new GridInfo.fromJson(v));
      });
    }
    ticketOptional = json['ticket_optional'];

    primaryDescription = json['primary_description'];
    description = json['description'];
    if (json['facts'] != null) {
      facts = <Facts>[];
      json['facts'].forEach((v) {
        facts!.add(new Facts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pk'] = this.pk;
    data['status'] = this.status;
    data['title'] = this.title;
    if (this.areaLocation != null) {
      data['area_location'] = this.areaLocation!.toJson();
    }
    if (this.startingLocation != null) {
      data['starting_location'] = this.startingLocation!.toJson();
    }
    data['tags'] = this.tags;
    data['activity'] = this.activity;
    data['activity_id'] = this.activityId;
    data['primary_image'] = this.primaryImage;
    data['primary_video'] = this.primaryVideo;
    data['thumbnail'] = this.thumbnail;
    data['activity_icon'] = this.activityIcon;
    if (this.badges != null) {
      data['badges'] = this.badges!.map((v) => v.toJson()).toList();
    }
    data['bucket_list_count'] = this.bucketListCount;
    if (this.contents != null) {
      data['contents'] = this.contents!.map((v) => v.toJson()).toList();
    }
    if (this.supplyInfo != null) {
      data['supply_info'] = this.supplyInfo!.toJson();
    }
    if (this.gridInfo != null) {
      data['grid_info'] = this.gridInfo!.map((v) => v.toJson()).toList();
    }
    data['ticket_optional'] = this.ticketOptional;

    data['primary_description'] = this.primaryDescription;
    data['description'] = this.description;
    if (this.facts != null) {
      data['facts'] = this.facts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AreaLocation {
  String? name;

  AreaLocation({this.name});

  AreaLocation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Badges {
  String? title;
  String? icon;
  String? colorScheme;

  Badges({this.title, this.icon, this.colorScheme});

  Badges.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    colorScheme = json['color_scheme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['color_scheme'] = this.colorScheme;
    return data;
  }
}

class Contents {
  String? id;
  String? contentType;
  String? contentMode;
  String? contentUrl;
  ContentSource? contentSource;
  bool? isHeaderForThePlan;
  bool? isPrivate;

  Contents(
      {this.id,
      this.contentType,
      this.contentMode,
      this.contentUrl,
      this.contentSource,
      this.isHeaderForThePlan,
      this.isPrivate});

  Contents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contentType = json['content_type'];
    contentMode = json['content_mode'];
    contentUrl = json['content_url'];
    contentSource = json['content_source'] != null
        ? new ContentSource.fromJson(json['content_source'])
        : null;
    isHeaderForThePlan = json['is_header_for_the_plan'];
    isPrivate = json['is_private'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content_type'] = this.contentType;
    data['content_mode'] = this.contentMode;
    data['content_url'] = this.contentUrl;
    if (this.contentSource != null) {
      data['content_source'] = this.contentSource!.toJson();
    }
    data['is_header_for_the_plan'] = this.isHeaderForThePlan;
    data['is_private'] = this.isPrivate;
    return data;
  }
}

class ContentSource {
  String? id;
  String? title;
  String? author;
  String? name;
  Null? icon;
  String? url;
  Null? creator;

  ContentSource(
      {this.id,
      this.title,
      this.author,
      this.name,
      this.icon,
      this.url,
      this.creator});

  ContentSource.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    name = json['name'];
    icon = json['icon'];
    url = json['url'];
    creator = json['creator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['author'] = this.author;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['url'] = this.url;
    data['creator'] = this.creator;
    return data;
  }
}

class SupplyInfo {
  String? supplierName;
  String? priceTitle;
  String? priceSubtitle;
  String? buttonType;
  Null? link;

  SupplyInfo(
      {this.supplierName,
      this.priceTitle,
      this.priceSubtitle,
      this.buttonType,
      this.link});

  SupplyInfo.fromJson(Map<String, dynamic> json) {
    supplierName = json['supplier_name'];
    priceTitle = json['price_title'];
    priceSubtitle = json['price_subtitle'];
    buttonType = json['button_type'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supplier_name'] = this.supplierName;
    data['price_title'] = this.priceTitle;
    data['price_subtitle'] = this.priceSubtitle;
    data['button_type'] = this.buttonType;
    data['link'] = this.link;
    return data;
  }
}

class GridInfo {
  String? name;
  String? value;
  String? iconUrl;
  String? schema;

  GridInfo({this.name, this.value, this.iconUrl, this.schema});

  GridInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
    iconUrl = json['icon_url'];
    schema = json['schema'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    data['icon_url'] = this.iconUrl;
    data['schema'] = this.schema;
    return data;
  }
}

class Facts {
  String? name;
  String? value;
  String? unit;
  String? iconUrl;
  String? displaySection;
  int? factDefinitionId;
  int? adventureFactId;
  Null? backgroundColor;
  Null? iconColor;
  Null? textColor;

  Facts(
      {this.name,
      this.value,
      this.unit,
      this.iconUrl,
      this.displaySection,
      this.factDefinitionId,
      this.adventureFactId,
      this.backgroundColor,
      this.iconColor,
      this.textColor});

  Facts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
    unit = json['unit'];
    iconUrl = json['icon_url'];
    displaySection = json['display_section'];
    factDefinitionId = json['fact_definition_id'];
    adventureFactId = json['adventure_fact_id'];
    backgroundColor = json['background_color'];
    iconColor = json['icon_color'];
    textColor = json['text_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    data['unit'] = this.unit;
    data['icon_url'] = this.iconUrl;
    data['display_section'] = this.displaySection;
    data['fact_definition_id'] = this.factDefinitionId;
    data['adventure_fact_id'] = this.adventureFactId;
    data['background_color'] = this.backgroundColor;
    data['icon_color'] = this.iconColor;
    data['text_color'] = this.textColor;
    return data;
  }
}
