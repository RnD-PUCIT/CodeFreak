export class AppSettings {

  public static baseUrl: string = 'http://localhost:8080/';

  //Controller Path
  public static authURl: string = `/api/Auth/`; 
  public static compilerURl: string = `/api/Compiler/`;
  public static problemURl: string = `/api/Problem/`;
  public static difficultyURl: string = `/api/Difficulty/`;
  public static problemTypeURl: string = `/api/ProblemType/`; 
  public static programmingLanguageURl: string = `/api/ProgrammingLanguage/`;
  public static eventURl: string = `/api/Event/`; 
  public static submissionURl: string = `/api/Submission/`; 
  public static roleURl: string = `/api/Role/`; 
  public static ProfileURl: string = `/api/Profile/`;
   public static chatURL: string = `/api/Chat/`; 
  
  //Images path
  public static SignInPath = '../../assets/images/loginback.jpg';
  public static logoPath = '../../assets/images/cflogo.png';
  public static Profile_DefaultUser = '../../assets/images/default-user.png';
  public static UserImagesBaseUrl = '../../assets/profile/';
  public static teamImagesBaseUrl = '../../assets/team/';
}
