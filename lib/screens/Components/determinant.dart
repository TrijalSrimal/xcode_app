// ignore: camel_case_types
//this class helps in determing position of a video in the cloud firestore db arrray that stores the last duration of every video watched
// ignore_for_file: camel_case_types

class determinant
{
  //takes playlist id
  String a;
  determinant({required this.a});
  //the playlist id has a respective number which is equal to the number of videos in the playlist and its position in the arraay
  int diversion()
  {
    switch(a)
    {
      case "PLfqMhTWNBTe3LtFWcvwpqTkUSlB32kJop": return 0;
      case "PLfqMhTWNBTe3H6c9OGXb5_6wcc1Mca52n": return 38;
      case "PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ": return 95;
      case "PLu0W_9lII9agwh1XjRt242xIpHhPT2llg": return 130;
      case "PLttcEXjN1UcGF_PCDUcQw2WOoh6MZtvWt": return 230;
      case "PLYfCBK8IplO4X-jM1Rp43wAIdpP2XNGwP": return 260;
      case "PLYfCBK8IplO6v0QjCj-TSrFUXnRV0WxfE": return 280;
      default: return-1;
    }
  }
}