class RecentScoreCardJson {
  RecentScoreCardJson({
    required this.scoreCard,
    required this.matchHeader,
    required this.isMatchComplete,
    required this.status,
    required this.videos,
    required this.responseLastUpdated,
  });

  final List<ScoreCard> scoreCard;
  final MatchHeader? matchHeader;
  final bool? isMatchComplete;
  final String? status;
  final List<dynamic> videos;
  final dynamic responseLastUpdated;

  factory RecentScoreCardJson.fromJson(Map<String, dynamic> json){
    return RecentScoreCardJson(
      scoreCard: json["scoreCard"] == null ? [] : List<ScoreCard>.from(json["scoreCard"]!.map((x) => ScoreCard.fromJson(x))),
      matchHeader: json["matchHeader"] == null ? null : MatchHeader.fromJson(json["matchHeader"]),
      isMatchComplete: json["isMatchComplete"],
      status: json["status"],
      videos: json["videos"] == null ? [] : List<dynamic>.from(json["videos"]!.map((x) => x)),
      responseLastUpdated: json["responseLastUpdated"],
    );
  }

}

class MatchHeader {
  MatchHeader({
    required this.matchId,
    required this.matchDescription,
    required this.matchFormat,
    required this.matchType,
    required this.complete,
    required this.domestic,
    required this.matchStartTimestamp,
    required this.matchCompleteTimestamp,
    required this.dayNight,
    required this.year,
    required this.state,
    required this.status,
    required this.tossResults,
    required this.result,
    required this.revisedTarget,
    required this.playersOfTheMatch,
    required this.playersOfTheSeries,
    required this.matchTeamInfo,
    required this.isMatchNotCovered,
    required this.team1,
    required this.team2,
    required this.seriesDesc,
    required this.seriesId,
    required this.seriesName,
    required this.alertType,
    required this.livestreamEnabled,
  });

  final dynamic matchId;
  final String? matchDescription;
  final String? matchFormat;
  final String? matchType;
  final bool? complete;
  final bool? domestic;
  final dynamic matchStartTimestamp;
  final dynamic matchCompleteTimestamp;
  final bool? dayNight;
  final dynamic year;
  final String? state;
  final String? status;
  final TossResults? tossResults;
  final Result? result;
  final RevisedTarget? revisedTarget;
  final List<PlayersOfTheMatch> playersOfTheMatch;
  final List<PlayersOfTheSery> playersOfTheSeries;
  final List<MatchTeamInfo> matchTeamInfo;
  final bool? isMatchNotCovered;
  final Team? team1;
  final Team? team2;
  final String? seriesDesc;
  final dynamic seriesId;
  final String? seriesName;
  final String? alertType;
  final bool? livestreamEnabled;

  factory MatchHeader.fromJson(Map<String, dynamic> json){
    return MatchHeader(
      matchId: json["matchId"],
      matchDescription: json["matchDescription"],
      matchFormat: json["matchFormat"],
      matchType: json["matchType"],
      complete: json["complete"],
      domestic: json["domestic"],
      matchStartTimestamp: json["matchStartTimestamp"],
      matchCompleteTimestamp: json["matchCompleteTimestamp"],
      dayNight: json["dayNight"],
      year: json["year"],
      state: json["state"],
      status: json["status"],
      tossResults: json["tossResults"] == null ? null : TossResults.fromJson(json["tossResults"]),
      result: json["result"] == null ? null : Result.fromJson(json["result"]),
      revisedTarget: json["revisedTarget"] == null ? null : RevisedTarget.fromJson(json["revisedTarget"]),
      playersOfTheMatch: json["playersOfTheMatch"] == null ? [] : List<PlayersOfTheMatch>.from(json["playersOfTheMatch"]!.map((x) => PlayersOfTheMatch.fromJson(x))),
      playersOfTheSeries: json["playersOfTheSeries"] == null ? [] : List<PlayersOfTheSery>.from(json["playersOfTheSeries"]!.map((x) => PlayersOfTheSery.fromJson(x))),
      matchTeamInfo: json["matchTeamInfo"] == null ? [] : List<MatchTeamInfo>.from(json["matchTeamInfo"]!.map((x) => MatchTeamInfo.fromJson(x))),
      isMatchNotCovered: json["isMatchNotCovered"],
      team1: json["team1"] == null ? null : Team.fromJson(json["team1"]),
      team2: json["team2"] == null ? null : Team.fromJson(json["team2"]),
      seriesDesc: json["seriesDesc"],
      seriesId: json["seriesId"],
      seriesName: json["seriesName"],
      alertType: json["alertType"],
      livestreamEnabled: json["livestreamEnabled"],
    );
  }

}

class MatchTeamInfo {
  MatchTeamInfo({
    required this.battingTeamId,
    required this.battingTeamShortName,
    required this.bowlingTeamId,
    required this.bowlingTeamShortName,
  });

  final dynamic battingTeamId;
  final String? battingTeamShortName;
  final dynamic bowlingTeamId;
  final String? bowlingTeamShortName;

  factory MatchTeamInfo.fromJson(Map<String, dynamic> json){
    return MatchTeamInfo(
      battingTeamId: json["battingTeamId"],
      battingTeamShortName: json["battingTeamShortName"],
      bowlingTeamId: json["bowlingTeamId"],
      bowlingTeamShortName: json["bowlingTeamShortName"],
    );
  }

}

class PlayersOfTheMatch {
  PlayersOfTheMatch({
    required this.id,
    required this.name,
    required this.fullName,
    required this.nickName,
    required this.captain,
    required this.keeper,
    required this.substitute,
    required this.teamName,
    required this.faceImageId,
  });

  final dynamic id;
  final String? name;
  final String? fullName;
  final String? nickName;
  final bool? captain;
  final bool? keeper;
  final bool? substitute;
  final String? teamName;
  final dynamic faceImageId;

  factory PlayersOfTheMatch.fromJson(Map<String, dynamic> json){
    return PlayersOfTheMatch(
      id: json["id"],
      name: json["name"],
      fullName: json["fullName"],
      nickName: json["nickName"],
      captain: json["captain"],
      keeper: json["keeper"],
      substitute: json["substitute"],
      teamName: json["teamName"],
      faceImageId: json["faceImageId"],
    );
  }

}

class PlayersOfTheSery {
  PlayersOfTheSery({
    required this.id,
    required this.name,
    required this.fullName,
    required this.nickName,
    required this.captain,
    required this.role,
    required this.keeper,
    required this.substitute,
    required this.teamId,
    required this.battingStyle,
    required this.bowlingStyle,
    required this.teamName,
    required this.faceImageId,
  });

  final dynamic id;
  final String? name;
  final String? fullName;
  final String? nickName;
  final bool? captain;
  final String? role;
  final bool? keeper;
  final bool? substitute;
  final dynamic teamId;
  final String? battingStyle;
  final String? bowlingStyle;
  final String? teamName;
  final dynamic faceImageId;

  factory PlayersOfTheSery.fromJson(Map<String, dynamic> json){
    return PlayersOfTheSery(
      id: json["id"],
      name: json["name"],
      fullName: json["fullName"],
      nickName: json["nickName"],
      captain: json["captain"],
      role: json["role"],
      keeper: json["keeper"],
      substitute: json["substitute"],
      teamId: json["teamId"],
      battingStyle: json["battingStyle"],
      bowlingStyle: json["bowlingStyle"],
      teamName: json["teamName"],
      faceImageId: json["faceImageId"],
    );
  }

}

class Result {
  Result({
    required this.resultType,
    required this.winningTeam,
    required this.winningteamId,
    required this.winningMargin,
    required this.winByRuns,
    required this.winByInnings,
  });

  final String? resultType;
  final String? winningTeam;
  final dynamic winningteamId;
  final dynamic winningMargin;
  final bool? winByRuns;
  final bool? winByInnings;

  factory Result.fromJson(Map<String, dynamic> json){
    return Result(
      resultType: json["resultType"],
      winningTeam: json["winningTeam"],
      winningteamId: json["winningteamId"],
      winningMargin: json["winningMargin"],
      winByRuns: json["winByRuns"],
      winByInnings: json["winByInnings"],
    );
  }

}

class RevisedTarget {
  RevisedTarget({
    required this.reason,
  });

  final String? reason;

  factory RevisedTarget.fromJson(Map<String, dynamic> json){
    return RevisedTarget(
      reason: json["reason"],
    );
  }

}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.playerDetails,
    required this.shortName,
  });

  final dynamic id;
  final String? name;
  final List<dynamic> playerDetails;
  final String? shortName;

  factory Team.fromJson(Map<String, dynamic> json){
    return Team(
      id: json["id"],
      name: json["name"],
      playerDetails: json["playerDetails"] == null ? [] : List<dynamic>.from(json["playerDetails"]!.map((x) => x)),
      shortName: json["shortName"],
    );
  }

}

class TossResults {
  TossResults({
    required this.tossWinnerId,
    required this.tossWinnerName,
    required this.decision,
  });

  final dynamic tossWinnerId;
  final String? tossWinnerName;
  final String? decision;

  factory TossResults.fromJson(Map<String, dynamic> json){
    return TossResults(
      tossWinnerId: json["tossWinnerId"],
      tossWinnerName: json["tossWinnerName"],
      decision: json["decision"],
    );
  }

}

class ScoreCard {
  ScoreCard({
    required this.matchId,
    required this.inningsId,
    required this.timeScore,
    required this.batTeamDetails,
    required this.bowlTeamDetails,
    required this.scoreDetails,
    required this.extrasData,
    required this.ppData,
    required this.wicketsData,
    required this.partnershipsData,
  });

  final dynamic matchId;
  final dynamic inningsId;
  final dynamic timeScore;
  final BatTeamDetails? batTeamDetails;
  final BowlTeamDetails? bowlTeamDetails;
  final ScoreDetails? scoreDetails;
  final ExtrasData? extrasData;
  final PpData? ppData;
  final Map<String, WicketsDatum> wicketsData;
  final Map<String, PartnershipsDatum> partnershipsData;

  factory ScoreCard.fromJson(Map<String, dynamic> json){
    return ScoreCard(
      matchId: json["matchId"],
      inningsId: json["inningsId"],
      timeScore: json["timeScore"],
      batTeamDetails: json["batTeamDetails"] == null ? null : BatTeamDetails.fromJson(json["batTeamDetails"]),
      bowlTeamDetails: json["bowlTeamDetails"] == null ? null : BowlTeamDetails.fromJson(json["bowlTeamDetails"]),
      scoreDetails: json["scoreDetails"] == null ? null : ScoreDetails.fromJson(json["scoreDetails"]),
      extrasData: json["extrasData"] == null ? null : ExtrasData.fromJson(json["extrasData"]),
      ppData: json["ppData"] == null ? null : PpData.fromJson(json["ppData"]),
      wicketsData: Map.from(json["wicketsData"]).map((k, v) => MapEntry<String, WicketsDatum>(k, WicketsDatum.fromJson(v))),
      partnershipsData: Map.from(json["partnershipsData"]).map((k, v) => MapEntry<String, PartnershipsDatum>(k, PartnershipsDatum.fromJson(v))),
    );
  }

}

class BatTeamDetails {
  BatTeamDetails({
    required this.batTeamId,
    required this.batTeamName,
    required this.batTeamShortName,
    required this.batsmenData,
  });

  final dynamic batTeamId;
  final String? batTeamName;
  final String? batTeamShortName;
  final Map<String, BatsmenDatum> batsmenData;

  factory BatTeamDetails.fromJson(Map<String, dynamic> json){
    return BatTeamDetails(
      batTeamId: json["batTeamId"],
      batTeamName: json["batTeamName"],
      batTeamShortName: json["batTeamShortName"],
      batsmenData: Map.from(json["batsmenData"]).map((k, v) => MapEntry<String, BatsmenDatum>(k, BatsmenDatum.fromJson(v))),
    );
  }

}

class BatsmenDatum {
  BatsmenDatum({
    required this.batId,
    required this.batName,
    required this.batShortName,
    required this.isCaptain,
    required this.isKeeper,
    required this.runs,
    required this.balls,
    required this.dots,
    required this.fours,
    required this.sixes,
    required this.mins,
    required this.strikeRate,
    required this.outDesc,
    required this.bowlerId,
    required this.fielderId1,
    required this.fielderId2,
    required this.fielderId3,
    required this.ones,
    required this.twos,
    required this.threes,
    required this.fives,
    required this.boundaries,
    required this.sixers,
    required this.wicketCode,
    required this.isOverseas,
    required this.inMatchChange,
    required this.playingXiChange,
  });

  final dynamic batId;
  final String? batName;
  final String? batShortName;
  final bool? isCaptain;
  final bool? isKeeper;
  final dynamic runs;
  final dynamic balls;
  final dynamic dots;
  final dynamic fours;
  final dynamic sixes;
  final dynamic mins;
  final double? strikeRate;
  final String? outDesc;
  final dynamic bowlerId;
  final dynamic fielderId1;
  final dynamic fielderId2;
  final dynamic fielderId3;
  final dynamic ones;
  final dynamic twos;
  final dynamic threes;
  final dynamic fives;
  final dynamic boundaries;
  final dynamic sixers;
  final String? wicketCode;
  final bool? isOverseas;
  final String? inMatchChange;
  final String? playingXiChange;

  factory BatsmenDatum.fromJson(Map<String, dynamic> json){
    return BatsmenDatum(
      batId: json["batId"],
      batName: json["batName"],
      batShortName: json["batShortName"],
      isCaptain: json["isCaptain"],
      isKeeper: json["isKeeper"],
      runs: json["runs"],
      balls: json["balls"],
      dots: json["dots"],
      fours: json["fours"],
      sixes: json["sixes"],
      mins: json["mins"],
      strikeRate: json["strikeRate"],
      outDesc: json["outDesc"],
      bowlerId: json["bowlerId"],
      fielderId1: json["fielderId1"],
      fielderId2: json["fielderId2"],
      fielderId3: json["fielderId3"],
      ones: json["ones"],
      twos: json["twos"],
      threes: json["threes"],
      fives: json["fives"],
      boundaries: json["boundaries"],
      sixers: json["sixers"],
      wicketCode: json["wicketCode"],
      isOverseas: json["isOverseas"],
      inMatchChange: json["inMatchChange"],
      playingXiChange: json["playingXIChange"],
    );
  }

}

class BowlTeamDetails {
  BowlTeamDetails({
    required this.bowlTeamId,
    required this.bowlTeamName,
    required this.bowlTeamShortName,
    required this.bowlersData,
  });

  final dynamic bowlTeamId;
  final String? bowlTeamName;
  final String? bowlTeamShortName;
  final BowlersData? bowlersData;

  factory BowlTeamDetails.fromJson(Map<String, dynamic> json){
    return BowlTeamDetails(
      bowlTeamId: json["bowlTeamId"],
      bowlTeamName: json["bowlTeamName"],
      bowlTeamShortName: json["bowlTeamShortName"],
      bowlersData: json["bowlersData"] == null ? null : BowlersData.fromJson(json["bowlersData"]),
    );
  }

}

class BowlersData {
  BowlersData({
    required this.bowl1,
    required this.bowl2,
    required this.bowl3,
    required this.bowl4,
    required this.bowl5,
    required this.bowl6,
  });

  final Bowl? bowl1;
  final Bowl? bowl2;
  final Bowl? bowl3;
  final Bowl? bowl4;
  final Bowl? bowl5;
  final Bowl? bowl6;

  factory BowlersData.fromJson(Map<String, dynamic> json){
    return BowlersData(
      bowl1: json["bowl_1"] == null ? null : Bowl.fromJson(json["bowl_1"]),
      bowl2: json["bowl_2"] == null ? null : Bowl.fromJson(json["bowl_2"]),
      bowl3: json["bowl_3"] == null ? null : Bowl.fromJson(json["bowl_3"]),
      bowl4: json["bowl_4"] == null ? null : Bowl.fromJson(json["bowl_4"]),
      bowl5: json["bowl_5"] == null ? null : Bowl.fromJson(json["bowl_5"]),
      bowl6: json["bowl_6"] == null ? null : Bowl.fromJson(json["bowl_6"]),
    );
  }

}

class Bowl {
  Bowl({
    required this.bowlerId,
    required this.bowlName,
    required this.bowlShortName,
    required this.isCaptain,
    required this.isKeeper,
    required this.overs,
    required this.maidens,
    required this.runs,
    required this.wickets,
    required this.economy,
    required this.noBalls,
    required this.wides,
    required this.dots,
    required this.balls,
    required this.runsPerBall,
    required this.isOverseas,
    required this.inMatchChange,
    required this.playingXiChange,
  });

  final dynamic bowlerId;
  final String? bowlName;
  final String? bowlShortName;
  final bool? isCaptain;
  final bool? isKeeper;
  final dynamic overs;
  final dynamic maidens;
  final dynamic runs;
  final dynamic wickets;
  final double? economy;
  final dynamic noBalls;
  final dynamic wides;
  final dynamic dots;
  final dynamic balls;
  final dynamic runsPerBall;
  final bool? isOverseas;
  final String? inMatchChange;
  final String? playingXiChange;

  factory Bowl.fromJson(Map<String, dynamic> json){
    return Bowl(
      bowlerId: json["bowlerId"],
      bowlName: json["bowlName"],
      bowlShortName: json["bowlShortName"],
      isCaptain: json["isCaptain"],
      isKeeper: json["isKeeper"],
      overs: json["overs"],
      maidens: json["maidens"],
      runs: json["runs"],
      wickets: json["wickets"],
      economy: json["economy"],
      noBalls: json["no_balls"],
      wides: json["wides"],
      dots: json["dots"],
      balls: json["balls"],
      runsPerBall: json["runsPerBall"],
      isOverseas: json["isOverseas"],
      inMatchChange: json["inMatchChange"],
      playingXiChange: json["playingXIChange"],
    );
  }

}

class ExtrasData {
  ExtrasData({
    required this.noBalls,
    required this.total,
    required this.byes,
    required this.penalty,
    required this.wides,
    required this.legByes,
  });

  final dynamic noBalls;
  final dynamic total;
  final dynamic byes;
  final dynamic penalty;
  final dynamic wides;
  final dynamic legByes;

  factory ExtrasData.fromJson(Map<String, dynamic> json){
    return ExtrasData(
      noBalls: json["noBalls"],
      total: json["total"],
      byes: json["byes"],
      penalty: json["penalty"],
      wides: json["wides"],
      legByes: json["legByes"],
    );
  }

}

class PartnershipsDatum {
  PartnershipsDatum({
    required this.bat1Id,
    required this.bat1Name,
    required this.bat1Runs,
    required this.bat1Fours,
    required this.bat1Sixes,
    required this.bat2Id,
    required this.bat2Name,
    required this.bat2Runs,
    required this.bat2Fours,
    required this.bat2Sixes,
    required this.totalRuns,
    required this.totalBalls,
    required this.bat1Balls,
    required this.bat2Balls,
    required this.bat1Ones,
    required this.bat1Twos,
    required this.bat1Threes,
    required this.bat1Fives,
    required this.bat1Boundaries,
    required this.bat1Sixers,
    required this.bat2Ones,
    required this.bat2Twos,
    required this.bat2Threes,
    required this.bat2Fives,
    required this.bat2Boundaries,
    required this.bat2Sixers,
  });

  final dynamic bat1Id;
  final String? bat1Name;
  final dynamic bat1Runs;
  final dynamic bat1Fours;
  final dynamic bat1Sixes;
  final dynamic bat2Id;
  final String? bat2Name;
  final dynamic bat2Runs;
  final dynamic bat2Fours;
  final dynamic bat2Sixes;
  final dynamic totalRuns;
  final dynamic totalBalls;
  final dynamic bat1Balls;
  final dynamic bat2Balls;
  final dynamic bat1Ones;
  final dynamic bat1Twos;
  final dynamic bat1Threes;
  final dynamic bat1Fives;
  final dynamic bat1Boundaries;
  final dynamic bat1Sixers;
  final dynamic bat2Ones;
  final dynamic bat2Twos;
  final dynamic bat2Threes;
  final dynamic bat2Fives;
  final dynamic bat2Boundaries;
  final dynamic bat2Sixers;

  factory PartnershipsDatum.fromJson(Map<String, dynamic> json){
    return PartnershipsDatum(
      bat1Id: json["bat1Id"],
      bat1Name: json["bat1Name"],
      bat1Runs: json["bat1Runs"],
      bat1Fours: json["bat1fours"],
      bat1Sixes: json["bat1sixes"],
      bat2Id: json["bat2Id"],
      bat2Name: json["bat2Name"],
      bat2Runs: json["bat2Runs"],
      bat2Fours: json["bat2fours"],
      bat2Sixes: json["bat2sixes"],
      totalRuns: json["totalRuns"],
      totalBalls: json["totalBalls"],
      bat1Balls: json["bat1balls"],
      bat2Balls: json["bat2balls"],
      bat1Ones: json["bat1Ones"],
      bat1Twos: json["bat1Twos"],
      bat1Threes: json["bat1Threes"],
      bat1Fives: json["bat1Fives"],
      bat1Boundaries: json["bat1Boundaries"],
      bat1Sixers: json["bat1Sixers"],
      bat2Ones: json["bat2Ones"],
      bat2Twos: json["bat2Twos"],
      bat2Threes: json["bat2Threes"],
      bat2Fives: json["bat2Fives"],
      bat2Boundaries: json["bat2Boundaries"],
      bat2Sixers: json["bat2Sixers"],
    );
  }

}

class PpData {
  PpData({
    required this.pp1,
  });

  final Pp1? pp1;

  factory PpData.fromJson(Map<String, dynamic> json){
    return PpData(
      pp1: json["pp_1"] == null ? null : Pp1.fromJson(json["pp_1"]),
    );
  }

}

class Pp1 {
  Pp1({
    required this.ppId,
    required this.ppOversFrom,
    required this.ppOversTo,
    required this.ppType,
    required this.runsScored,
  });

  final dynamic ppId;
  final double? ppOversFrom;
  final dynamic ppOversTo;
  final String? ppType;
  final dynamic runsScored;

  factory Pp1.fromJson(Map<String, dynamic> json){
    return Pp1(
      ppId: json["ppId"],
      ppOversFrom: json["ppOversFrom"],
      ppOversTo: json["ppOversTo"],
      ppType: json["ppType"],
      runsScored: json["runsScored"],
    );
  }

}

class ScoreDetails {
  ScoreDetails({
    required this.ballNbr,
    required this.isDeclared,
    required this.isFollowOn,
    required this.overs,
    required this.revisedOvers,
    required this.runRate,
    required this.runs,
    required this.wickets,
    required this.runsPerBall,
  });

  final dynamic ballNbr;
  final bool? isDeclared;
  final bool? isFollowOn;
  final dynamic overs;
  final dynamic revisedOvers;
  final dynamic runRate;
  final dynamic runs;
  final dynamic wickets;
  final double? runsPerBall;

  factory ScoreDetails.fromJson(Map<String, dynamic> json){
    return ScoreDetails(
      ballNbr: json["ballNbr"],
      isDeclared: json["isDeclared"],
      isFollowOn: json["isFollowOn"],
      overs: json["overs"],
      revisedOvers: json["revisedOvers"],
      runRate: json["runRate"],
      runs: json["runs"],
      wickets: json["wickets"],
      runsPerBall: json["runsPerBall"],
    );
  }

}

class WicketsDatum {
  WicketsDatum({
    required this.batId,
    required this.batName,
    required this.wktNbr,
    required this.wktOver,
    required this.wktRuns,
    required this.ballNbr,
  });

  final dynamic batId;
  final String? batName;
  final dynamic wktNbr;
  final double? wktOver;
  final dynamic wktRuns;
  final dynamic ballNbr;

  factory WicketsDatum.fromJson(Map<String, dynamic> json){
    return WicketsDatum(
      batId: json["batId"],
      batName: json["batName"],
      wktNbr: json["wktNbr"],
      wktOver: json["wktOver"],
      wktRuns: json["wktRuns"],
      ballNbr: json["ballNbr"],
    );
  }

}
