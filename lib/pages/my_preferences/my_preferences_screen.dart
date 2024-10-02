import 'package:dark_coffe_app/pages/my_preferences/my_prefences_cafeteras_screen.dart';
import 'package:dark_coffe_app/pages/my_preferences/my_preferences_cafe_screen.dart';
import 'package:dark_coffe_app/pages/my_preferences/my_preferences_more_spicies_screen.dart';
import 'package:dark_coffe_app/pages/my_preferences/my_preferences_other_screen.dart';

import 'package:flutter/material.dart';

class MyPreferencesScreen extends StatelessWidget {
  const MyPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis Preferencias Screen',
          style: TextStyle(
            color: Colors.amber[800],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyPreferencesListCafeterasScreen()),
                      );
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image : NetworkImage('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMWFhUXFxobGRcYGBoeGRoaHRsaHR0XGB0dHSggGBolHR0dIjEhJSkrLi4uGB8zODMtNygtLisBCgoKDg0OGxAQGzAlICUtLS0tLS01LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAKgBLAMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAEBQMGAAIHAQj/xABOEAABAwIEAwUEBAoIBAQHAAABAgMRACEEBRIxQVFhBhMicYGRocHRIzJSsQcUFUJTVJKi4fAWM2JygpOj0kNj0/E0c4TDJCVEg7LC4v/EABkBAAMBAQEAAAAAAAAAAAAAAAECAwAEBf/EACwRAAICAQIFAwQBBQAAAAAAAAABAhEDEiEEEzFBURQiYTIzcaHwI0JSgbH/2gAMAwEAAhEDEQA/AKninSTJvKbz5Va8rhvBFQ4An1m1J3sqI0ApVt9bSOPODamyn2ksdytQ2Orh19tcjex2JUytNYtzWQFkTuZ+80S3itOoBRUSY1XjfgKcN5EHUo0LATvIFztvUZwjOGV9IpRUbiBMGd7bVm0wpNCpTjupMzvep3TeZInrR2KzZhZGrvCDb6oifnXjGKwgIkzKoukzPLpQv4NXyFNLQGpWuCNO/EwLdaJcxyChehBICfCrnYk++KjK8M6NAUBccLeVb5Y8yAlBhJJMJVxvvPI1O0Vpg+Vr0jXqKYHEbmjXMeSSSvUmRYWPKw3moM4OHUotKXplQJgWEelErVhgQS8CTxA5cbVJ11Kq+gzyhalhRkkBUR8TxoVGYIQ+NayVFQCUajubXE7URgsbhkizhKjxgz0tQy+zzS1hS3Vd4VBSSEwLRbnwqVxvcrTrYsjrZF9Rvw4VIEmRcm9+UdeNQBxCrAmSYvq4cKGxuMaw4JdeSgHnJVI5Dcj0rndydRRRtJW3Qe6+qTpMJ8r0XhXCQSYjhVSZ7UsqQtxpDryWhK1oR4EwJuQTFr86r2I/CiylJQllZvMlRH/61dcLme+k5p8RgqtR013EX868VM2NcoH4Vm5/8Of2v/5otn8LTZ3w6o/vn/ZRfB5/8f2hPU4F0f6Z1ICLT51utQvw5bVRcp/CAxiFBCGnys/moQVE2kxtNpp1ge0WEeOlL4CgY0qsQdovaZ4TQlhyxW8TLLjl/cPmjzg+QoDtDjghlRFlJKT1+smiUEAQVCaV50UKZdTrFxc7kecXqcZUiyhbGWKxqUJ1ewRc84pUM2Oh1USQrwpAuBpB9abt6Tve0Qf40qaQwkEhyL8Ty4Xp0wpIByfELU4XHCY0xF9IUdgakxrJWpRSSkpTqkGxsbeVFPOtrQohaSjUCSOYEwY6UsdeYcMJeTEQbxbpzqkWBo2y9TbrZWVnWkSqJAG9jwikeKxOjxFarbcj0HP1pszgvxeUpWPGLyOEcKAdw6kJKitITMGdvSqWie5CjM1LAkkA8QLnj6WprlrhWmYtFidz5iLUqbfbK57xA4gj/sKOYzdtNlOpPUT8qdCsSdoEKUQlMi51eKPjS1pOgBJWqVK0nnFog8KavNtBTjnegkzYAmo8I1h1d2orTqBuIMkzaRNVTJUa4ZCiolrUQgixI34gxvR7uJ1oWlURzST7PKohlzraypC0ALOx4iZjpWPNlXhCm54gGtaBTI0hCFokROxm1+Ec68zTEltYiI4/KvfxAqKSVIMEE3O4ojMWNREFPIg3nqORoNqwpOivv447FR229fuoXFY2FfWIsDxpk/k+qwUJHCRt61DiuzyFGZUDF9JAH/enTQrTLLPetXSYULkcCNhPGqzmzKG1pbkkQLgiQetW1t5PcqUhQOmTayZqpO5mqSsobJ8j980qe4ZLYbNYlTDYWCQgmQlXHp0qLNsclaUrE+K4t/PGoEZ2pxJCkJKBAI8+U1PisyZCQCkK8PhSNxHA1t/ANulgLKFKTrgQTG17DfzoND6idCYCpJ8Ucb2tRz+eJTGltMWNzzqfBYjvNSlMojTMjfoKNvwal5FjGLjwESon82eHI8aZ4XC965sZAuFcxNqNw7rI+k0QoCPCBvyPKtcBmdyvuoUNyPuNSk73SKxXZsV50QMWomwCk77bCtszcCtJBBIn6swBaPLyqzNKS+BLSCZE6vhUi8vabUE9yhSlSYvAHWalr+C2n5EWVQVcVQZ9B/E01xOKc1lQNosBwieFNXW22WwpLAJWdJT/ADw2qTvwFBCmETwAMn1tb1qMpW+hWKpGmQPqXoCuczXP/wAMGGJxDS0kqKkGxNhpVuBz8VdHcxSGiCloTFlT7ha9Ur8IuHOJaQ+2NJa1hSQbwdJKh5ab+dHhZacqYnFR142qIfwcOKTleZ6zBKDpCuP0SxEHrVJRmGlIHdN6iOA25WnfpwoAPEXM+dp/njRHe6pJ3kn7z8hXsP3dTx17OhEMW7zV7qMwOOUPrhLk/ai3Xb3ULPlx/wDxmvAoDb09QFD3iKzimZTaLp+C/EFWbYYBpCE6l3CYJ+hcPOqq8pxWIeJBICl3j6vi58KDW+eBIHT7vh6Uy7N4B7EvJZblRUSJ4AWlR5AD7xxNZyUYhSuVs6vlOHBQlGoqUnQmVG58IrbMsAhtLpWtQhtYGlXGraxlqBHh2jxQBtxoLOVsIbWVICxF+smN68FXq1Ht601pQfoBbABP1d58W3PnSP8AJSmwFavDeZgmJ60+QpNoUNqhcxaQIN+hp/yIrRXMc0ChRaSU87Hl0teq8lm9kEjmBafQV0LDqEEJSUhV+nKluKSy1ZO87A3T1jhVIyoLVijLHCXAh5sr1GNagfQHhHzqbtDgUqSBEQTAHL7hRKcbqOpNxxOoxI++gncwC7KbmD6VRNk6Kq9h0gnTeKXqXBq4rQ3J+iTtw++h2MIyoqKmhAEyCfYKspEnEqalE7VFJBtM9KtuDy9tay3+LlCgATKjAn76PGTst/SEQB744im1iOIrzhz6NCTuUzHEdarga0m0iLTV5x7LKyCq402UD7qjVkDJSTcjffpWi6A0VLDoF5V6Dh1pjl5QQUKmQZCwbjnNbsYVnQshtcDhNzHEHetUdwi5SpNuKjsR76a7F6EPdS/ZRXERzPMHmBQ2ZaA4r87rcelqPbzfDgylKQZt1oNfaFkE+Hj9kUTDvB4FaEOBZEFFgkEieAqsOsqKdjImbcehqyjOw4kKbOmTpPQnaRQ7udkKCSkGN+vrzpFq7jPSV44UhIUAb/wrVWDcKgIJgkWH82p+O0afzWxOxHCf7POmGOx2hoKCRrULJ+Io6mLpTKerCrUY0G3SnuVtO92prTpGkqnnMAeyKSnFuA3WoiJ3iT15CmmQ5g65rSFW0yNieoBNGV0aNWM2MBpSJjVPtHWsxOFO6UkAm4+VBIx7pVdQgbi1vPrU+HzBQWhJWT4gI5+6oaZF9UQzD4MhNtU+vto1KC24SlOtOmJgkyQJpA7mr6HHE6VK1Hw3MpE2IA4Vo3nLyVAlxcGbSfdzpHCQ6mi5BKygFSVG5txjmahfUorB0EFSbnYgbaZjc/GlpzN0rADhItsefOjzj3FGA4QlIMqjiBsfOpUyyaPcbmEBJAIiEp2BKym8aiB0uY3pYp7GBxcYNIhREd+3Y8Qbb+fOl/arEd+rAMklRONb1T5x9xrqmV37083nD74+FdmDh4Shqkji4nickcmmLo4bmnYfEOulxDHcpP8Aww42oA8YOtMDpFqJzzsg88GwzgkMaWkoVpcbOtQIPeQFCCb9b713R91KBKjHLmTyA3J8qzDPoXOlUxuLgjzBuK7o7LY86W7tnzsn8HOO+yP20f8AUrw/g5x3Bv8AfR/1K+kdFKjmKlmGQFHeCeHt60bBRxLMexOJWhhLeEDSm2yl1QW2e9USTrPita0XqzdlMG/gWwlGAUpf56+/aGroBfSkcprpIVi/0SP2h861D+JP/Db/AMxP+6pzxqaqRSGRwdxKwvtFjJn8QPl+MtfKlecZhjX0FH4kEzF/xhrgQavgdxJ2aQY5LT/urRb+JBALSJOw1pkxvA1XqXpcfj9lVxWRd/0UtGb4oR/8CmwH/wBS1vzrU5zizvgkn/1DUxyuK6O0mUyd4uK8KaHpsXgb1eXz/wAOfYfPsSgR+JT54lr5UvczHFalEYXebF9o7101QqNQo+nx+BfU5fJzPDYvFqC2jhilMalFDiFkDYkgQYvwnyqRWKVMxO2wsTG/nTjtXhtYxvTAO/ehX3oobKlK/EsOoED6FFymbhI3qWfGo04l+HyyneoW4VwiZBANwIOx4U3wS0qvHCl2NzspSY0g7bGQaUr7TOFI0wTxt7xU1Fss5JDjMXiFkibgAn27caxlnWnS5IITaJPlvSrL88eUrQQFKUQB0nrVnaQFBXiVKSAdo9KamhNSFGEf0NFKkmVK5bc7UagkIhCpG/IgTeRQuPx4Q+GwBECfM0uxmfpSop0yR0FMkBsb4B0ALiSqbAyfKKr/AGlbU4RcISngeZ3iKkZ7RGTDYt1HtFF4XEuupJASnlIF+tFWhHTKR+L2nhe9/dQ2pNXT8YdbcKHClQEcExPS17VGnMVcENjzT76exdJOrIyCSHki44HhwoxAbQmHnEKJ+pIjpeakZUkm52BpN2lc8SLDTp5XmeNRjcnuWlUVsgpGUALlWnSDO1+lG5vgvxjToIASADe+wpVkmfST3kkAQEjieE1jGPOlagkglUW8+NFqSAnFhiMhEfSL8UWtw59a8wOSLY8aXEAAkzETPOj8Y7LPiBkC3ToONbOOJWgpAhQCZ6VPWx9EfAtawwO7jV+CePqamawKELSrWjebr+6hTg72mRe9BPawYKTG8gW86ZO+4Gkuw2xWWIW4Vh5AnhcTUH5FCwFd+iZ2Jt6UBh8UBGhNpi25PA00w7C0lKFt7k+e+xFK7XcZNPsOGez8EOJWCLHe1EjJ1qIOtBvMcD6eVe41wDDAKHHTxtwnrWZW0lSCphWpPUkEEDYjhXO5M6EkIsdlmnNcrSYOt9SzH/LCDXRsgXLU81rP7xqiDDkZvgFrVCUJfV4iAPqJHHmT7qsGR9osOhlKS80DKpBWmbqJ516fD/aj/O55XE/df87FofUkeJQJ4AgEkc9ribbDhXuHcCoVBkSNRBEi1r3ItvShPaHDL8IeZM8O8Tf30W3iAkQAAOVXs56D8Y9pbWrklR9gNcm/BHmKkuPKXKxpbBM3EqN+v8710fMMTqacAFyhQ9qTVD/BJlC23Hi43I0tQTIEgqki0KItbypXdbDxq9zpeYZoGlBPdqWYkwQIEkcdzY26V7j3m06AlkOKWCoCEjwiJUSf7w9pqbF4VKynU2FxzMQPiOnSpMywqXAkKaDkHnESIN+R2ikanvT/AAOnDa1+QbE49ttttxDZUXSAhKAkKUSCq5JAFgTc8KjXmTZZTiIMEWBHiBO6em3uo/HYRC29BbCkiITttyPC1QYnDJ7rRolMfV/jTe4W4lNy7tQXMalkDwLDhnyBIq1uKkHhaqWzlBbxff6SAC7E8iFAX4708VmBphA1QXaFT7PjvW6SYuZNJnswIElUDmSAKCXnzf6dH7afnQswVi29b7zf28G4n2pXSrsk+k5ewFKSJbAuQOJtU+SYxDmPb0rSrU24DCgY8J39tU/CNNtsMgGXUqWlSSbCFKAI86jxG6R0cM6bsd4vBJBhDrd99ahS5jIlKJCVtjjMzaOlT5bhA8XNSoUBqSIF6aYN4Ka7sJggXJ3E/Cue2jr2YqR2aRqSs4gJIOyYj0M07dCQFBLiSpVtxe+561T86b0aSkxChf0tNR4VNisLAJUTJBPlHrTbvexNrG+Y5Spa1L1JExHiE7fOlyezr2qTbyg2qTC4lPiDqErsSDEQRHAVIwoKGpI06udMrFdMFw2RuIUoqQVDhttRbmEdgAJPQAi1S4/A60J1LOuDA1RPwiKVrypKUqJJkbeLfmN6NsFIIZyp9RNoFiQo2JmxHUXoxOTkWU2pR5pIA95pM02IhEIjiVkGaMeyp+x7wLkTIcj0vv50QbAjOJZbj+tVJJEq48t6OxGIasoJKiQNoMdCOEUtxOAb0qV3gOmSnh6GaHypopKiCTqF/MUNC6m1tbDkoaT4imNUXFqZ4fL9KPBeTIn76Rlpxwiyo+zvMculWdjFFLYCxcTHPoKnNUisHb3J04M6QFGZ40sYW0gq3AmNRvJ6VJi8YpKSoBROqAPsmOnCg3cH9TUBE+KdpPE1JIq34GTOESsm8z7YrTEYhIJZUZEQBHCDb3UDgcShtcqWkRN5jw8I58oHKhc6c+naeSZSSnYiIB39lNoE1jfKsM0mVNgC0E7nyvsaYYrCkRodQhwn85Oo35Chl4xsNgpABmVAfa4A0M9jHCde5TEGd+M7bCfdU2t9yqarZDrNEAsEKdSFCNShtPlwoLBaW0AIXdJn6qvEDwVAvQ+HX4FlSQFG6jxN5rA8CkbgA2HlS1tQ127Bu1jzeJQAEqDzZ1NLt4SN0njoVAkdAeFc/wAVikNqUlwrbWCSQUbSfuuK6GvDBXiAIE/WKTfyqhdrsahOKxgJCdbGlAg3MsGLbWSreurhXvpOTi1tqAcRj2lpCUruTeQQI8zVvybtE5hkjSrU2N21G3+A/m+lulcqaXpVAII91O2nHUoPBAvBIPsg11uPg41LsztGXdsMK6J70IPFK7Eeux9DTVvtSyBAxDXtTXFGHVIZbxBbhpQWEqEGdCkJWogi3icSL86kZ7QNqIAEk7eEURaR2n+lLX6w17UV5/Slv9Ya9qK4y7n7aZlvYwfDxvbfpXis/ZgEoF9rD/dR3NS8nZT2qR+sNe1FaK7WN/p2vamuR5ZmCcS82wy2C44oJSDABJ5kmBQmY5n3ZUlbZSQpSZ02KknSqDMGDyrGpeTrOL7YNL8KsS0RyCkD28TSPNO16ECGvpF876B68fT21ynBuFbgCRJHC3x608wjTzzDzrTadOHguKKwCApWkDT+dfkeNBp9jRq9yfMsc44e8dWTynYdEjYVEvGMg3Xy/NVbmIigluhMlySsfm7RG4FKu4dV9KpB06inoCLlPQxQUfI7n2RdMmfSpag2tSQpOkuFJBSknxaRxJAgf3qvmW4DCK0htJ8KdiDHKTO5rn2WtBK3AdglJtbcA/H3VZuzeeoDiWlKAkRJMAHl1rkzt3sdeDSlv3Hq8Hh06zoM7E/ZnlWmFW2lMoCoIhXSPtcqMwaU94slzVIgC0fxodaE6FoTxBvF/wCNS/JXuJs1w2HUda1qSBeIBFRnKmkKEuKb1fV1ptB+zwobM2FJFyBcQFb8bx0+IoTvStKErd8MxzCRyA4VWJKTLGzkMKgrn0gRXj+VYdH13gOmr20aEgNpCD+amDO/r1qrYjBKQsiAVcLAhQ4evWgpMNIfuLwi/CSCBYbx7aAfypgp095qOwIO3XypMrGx3iSAVxAsYHl1o3s3j9OsGNrA8TyFMgEj+TMhRKVEWFoJgjiKmcwDYjxcP5twpu8y2Gw4QZUePOlmLbBcVAG/FUcB0ramjKKZSsW8pBhKuN52B++m35T0oBSDqjlHrPCkOHcUtYDgRp4nTw5iLmi/yupIjSdN4kbdfOujScusdZdnjhIS44EIgmfrKPMJHzpriM4aGlwatEAGSCZnfoKqGFxKUq71KwVgGyhdQNiDQ4xi/Gkjcz1AvYCpSwqTKxzOKLijPWwsAOKVPMWSPZc1pmWYvNthRIAVcFKgduFtuG9U7ENlMFwztdO46coqTHapac+tpgxwI68zSPFBPZ2ZcRJpjxeePKSkG3IwD1g0SjG8zJPIC3ObUofxgS8kAwCkkQN7XkcKlwrxUhRCbkmDtAPwqUVfYpHJfUsOWZsjvUJXGg2Nhvw9KfYnSlKikpUNPhgCPXpVGbwySg6oKwYgGSOWxiKLYwmoaAskK+slKr2+0OVJOUUUWRrcPw2cnSdSgFcDHhEdBwo3LM7DiiFIaIB0gp4n4UubyhDgIbOgQYSDx+VHZRka21SdM2Ebx16W++k5dXJv/QYTk2iz4hM4dYR4FltQT0XpMHbnHCuN51hMPpbRoX3zKdWJdUQoOEqJJSZ1KspIvGxrqTjbumNW6wSDdUDbjFc07XIIxON1b92n/wBuurhX7mifFx9qYnQzgVPILilBrWNaUCFaOITaNXnUOHwiFQhuVqUSLA6jJhIFrq8huaVCmeAxRZKXR9ZtSVpn7SVAj3iu888L73Rgwyp1BI77SibgrXh5CuCf6oq/w9aU4JnStCituEmT400EZMkyTMn33rUpNAw7caLqlhCkqLjidKQoFSjpWkAJ4mVAetQZrlLjKtDiFJcCUakqBBTqQhVxuLULluMUy606keJtxK0ztKVBQn1FXbt1mCMXjncQ3dt1LShP/ktyk9QZBHMGsYS9gXwxjcM+spCEOJKlEwANRkniIF627VtuOFK4T3SncSpteoaVhTtyDNwDArVvBlVpMfztyo57NUDDNYbTqLBeCFmQJdkmQCdRB2m1hWCIcnR3bupRSBBH1hvY1Z8ixwYwWPadCkKxCWu6lKgFQ7qMEp0xBmZpQ/im4PctaSEAtzC16hoSpZVpE8SBFiAb3JUpdcS53iirUTJUqST5k7+tEA0xQCnnFahAgc5Kht7qlxOJlt5sRAfdcnnqMeyBNR5qQh+WQAFpQSIlIUpEmOUSY5elB4VorUUibpV7YJHviloay8dnQhWKdaWAULCEkcbDgeFans1hluHQXCAoiAocPMTtQ2Fwq1vPFuZTp2O3zohxT2HT3gbnTJvMSbSelcOT63TOyMYvGtSLO33bTNwA2EmypKkxx5x86oGYZ4+qSHChJsEptYdd6DxubOuyVuklW6AITHKBQ7AUsgBJVcDa1zYE8KMYUc+XNq2iWvsli1vIW2cQgOQO6S5eel7wfbtSzE45bTpLrAbcBhaROhQn60H7wa27WZWsKW+hAQlBSFBJEJVtKeYBEdDUOWdolvKQ3jAHm53iHAOhG9MltaBKTj7WzoGV41GIH0cwAOkW4dOFMMZlzZGpUWvMxXOnsraOJU2w8tLiVeEC2kaZgnkDApbnuOxo+ixClwLEHYx1A8QoRhY/OlFe5HR28EwTrCUqt9qamxj7TLRcKB4bQAJJNcly3AuuEBtpRniAQPbtVnJxaMMUPIhvUAkqjWOnl51tNMfHm1dhs52s1jT3Mjlq/hUSu0bKvEpm53vVfQyCJPHaKiGoWEx5U2lFLFOLeUdMiCDWO4oxAJqRhJDQUozI9aH7kKWJOke2uuSSOGFskbaUoSd+XGOdEMqXCzMaQJtvyr1Ongq/lFPMty4uoUCCSQDI4+nEdKk5V1LKN9BQljUU96JQVDVBMxxFuN6MdcQFnQqEBMAK3/kUzxeWoQ4DER9ZO4J59LUA9gEatQqLWp32oLTjshQt0kqVaYgERtxqNOOIBTMSNjsadYvK0qMiUGLxxPOl2Py8BFzfyFPGNoi1JEWW5hpX4Rc+z1pg/qCpQLgSYM/yKTowAN9R6xEUywLY1BIJ8Vif53pXiV2HHd0NMpS4tLjyV6dAmCd+ECmeBzFxIUSuSopNzfbnwqJnIUJSkla7wbJ2nn1pnh8C3AAUZE3CL/fUZzizvhCS3HScepLais8fCeJBA/jtXNu1LwXicYU7d2mJ6d1NdCwKGw2UKWpY4Sn6sWrnWeJSMTiwm6e5tP8A9uffR4VLWwcW3oRVDTPLcOHilomJWkTykhM9QJqRjJyoAzY0dhcuDZChdQgjzFxXoHnEXaLsmvCgfSIWDYFEyOqgRYepquFo8/fV3bxWoy4lwK5Agjzmb+vpFEMuNzOlXupdw0hV2I7EO49zSFobSkSpS9XEwAIBknqRtR2f5L+J4hzChevuyBqiJlKTMSY350c5iAHQ8yp1pxOyklM+R4FJ5EULjnFuuKdWZWoyTYfcAB6CigEGHsKHRlgUpZWfDukCLk23Fx7b++iNBqVujQUCfkoJgtHQpJkEyRcQUq5pPTbepHHnFJ09wgE7kr1J89OmT5TRqa9KaNGF2FY0KSJJ1KgzxKkrG3nUuQYBstFyVh2HFpHh0FKG3zBETOtsDfaanLfibPJ1r3rA+NHYNrwNwBdjGe5p4+u59tL3N2NMqxCk4l3TxUkG3C/sp1jsQ73vhWNP2YEeR50s7Ptk4h8ggQoTPKTtVtwDYBUVaTO0fcededma5jPSw3y0U/M0BtPeqQgXMSgXtuOlVp3P3RGlQShJBCIEGDN4FXbtSw862oCBIgItAA+6qvl3Z24U/BH2Qfv6U0HGrZDPHI2lEs+YQcCHHEkKDZc0z4VlV1A8bEgxXM0vqSZG8z5V0DtBmyfye0kKGtYCY4wBCvuj1qiu4czBESAR5EW9tUh0ObiE20bYfGrCy54tZuVAwb7m1dBwebvOBHgSsKAUDzSNzfjVKZwC20Ba0kBwEJniONMchS5eEnSkeEkm4M2FUcU1ZsEmnTLevNylUEACCQQbyNgRR2ExyHZSq3Im/p0quPoMJUoToiytiBwp+1m+Hb0gKSJt4bx7KSjpslaAhwlKAUzBEEx0tc1BgsQdAJTM35Vtj8Y3CVolRJiAJAEcRWuHcfKQQUJ6FP3chEUKsbVRyBJOwowLB28qELUJ1TsdviajbUtRgV0nInQ3Yy5azawqz5ZjVNpSANIAAJ3mOUikmW4lQShpR8Rk1It8JVCiYvfeoyWotGWkb4p+SVbzeg3GyoEj20OrMExsSAONL3cxggmdJ3A/m1MouhHLfceLd8Mmx1fCluYLlMdfhQGOzQEo7udG5nffbrajsxeQpsFJG/wopNUBtO2A3FSsYsNrCiYg1E2JpdizM2400hIvezois4adQgocBWdI08Z/k0I9jlBzSFEOBRStEQRHGlnYnBpBaVpSVqd8JVPgUCiFADc72MjoaYOtpZzHElcqT3zniVuRJ49Db0rhbjGTijujKUqbC8Vj1xF5IvHx6VWHyVYjEarksGY827Cukfi2F7pLmiUnjJtPvqiuFCsxxGn6ndiPKWZ981Xh5Jy6C8SmokyG6kDdSpbrcIrtOIg7qtks1MBXtYx4Gq1LVb95WwVWMQKaqMt0STUajRARgVvFazXs1jEGNkNqIFxoV7HWzPsmmgEKbH9nGp/0V/OlWYkBpd48O/8AiT8JpyhuVtcivGD0LQpWEm7HNpOKxBPAiOt1TbjwqxY4IkKCk6TwAAgx76qnZZvXiXTJHjtE7yfdTDPs7YA06wNKiCNBueleflXvZ6OL6ED9pXUNtlZQFQJiYmeu9UdvPwkq+iEHgVEirrlTjeOfaw5MtOFaVwClXhTqEE7XKeFC9pexmFYSyUBcuJ1GVk7ulIjl4RV8OO42znzZalSKM7iRbY3OxNvbTJvtBBP0YJJTpE2AA0gbcvjRPbDJ2cMsBpECAfEpR39amw+UMlTI0fXWkEyZvynY1dQiQ1yGz2bM41n8WUosuhUoSsbEWgHj5VaWsMywlKNoSBc70X217HYbC4dDyO8WvvEJHeFKtIIJJBCQZtzoVbaVQDBAERxqbjWw8W3uL80wpErBlBAgc5G9U97FBMJbJgG8gSD58qvykyCk7cLi1KXuzzCjJ8JkTCuHQcJpNiqKurHOkFOpRB5/DlWjWJgeLWT0UaeP9lzJCHRA+oDy4zFDL7OqSYUtE/3wPcRW2GsqrWFUppRHoPKmHZ3DBtxPeoUZ8tuXtrbLkFCbjieIpxgVBSwDtxuKpKVJkIxto1xeCQsBaElBSJlQuozPDYcKX5xhAEhYkbSOvOrLiO6mTqIgCJF/Oly3UK1hSTBIIO48omowkVyR3Km64SCeAievShH3uG/H+FWLFspUCAPuE/KlZwJUbAcoEmPdfzroiyDRDlWHC1aVJJsbjhymrB+RWimylBWqTJkbR9kXobJ8G42605oc0ocQVDSPEmRqChxETahc/dU3iHUoUtKJlKdSrBQB078CSn0qc5zcqiVxRhp9w8byRkIN1FfBU+H2R8akw/ZJgtrWta9YjTpsCeMyDaqxlalPOhCnnEyDBCiTIExvymnGPwASzrGJfP0hQdSjE6QoQkG1p4mY4UKyeRv6XgLyohh1IAlIXxsYlMnpxvRebAPYl5IKYJVChxvxMXNQZeyyGkaFOlUydRBE77aPjTZWHQ2W3ka1OmdWuNBJsIsFT7a5nilr1FVJJU+g8by1Iw6W9aoSBBtPSuePAJzDFcktGegHdyTyro6szQhMqgAcSQPZNUPJn1N49WK1f1moq8IUAFKBgcCRA35XFPwl6nZuMrSkjTC5uwVqSt5CEgEhRkgm3hGkE877Wrb8tYf9Knyv8qumN7WhZBSot9E4dkz+1q91aN9pJt3yweZw+H+KK7zzymHOWP0qff8AKonM5Z4LnyBq7pz0gknEuf5OGj0HdwK3PaPliXf8jD/9KtZjnpztvmfd869GfNfa+7510BXaEkf+Id/yMN8WqgbzxXHEuDzZwp/9qtZijHP2ftVoc9Z+37j8qvq88P6yT/6fC3/0qV5lm5cQpClqg8O5wwJ6ShE1rMVb8tNfbHsPyrYZyz+kHvqbLMahp3Umx5qZaXHo4mBT8dpFEGHGyeRwuD+CDWswgYzFtU6VSAQCQCQJ2Btxpllz+peHMRocxAc1FMp8CEwsTI2VY7Qa9xeOLjqCXNlJI7tCEIChsdKWUyRzI40yazkLDiHG2lEzocGGw51KA3lLaYvfUJPGszA34P3AXHgTB1JPGTdVqsfaR3BhOhwISqbymD7YqndjXwziyXSCF6gdNoVqkETBNxEDgavGZJYeH0jalEGQdNefl2nbPQw7w2EvZphtvMcMlsQkIWq3Ha59E0X20+rgx/yMP+8pZoTK3x+VZAI04VyBF50ucPUUX21/rMKBwawg9gcm1dWL7aOTLvkZU/wmj6QeSfjW2A/rML/5rdZ+EtJLoi9h8amwDBAwqj9tv7qexaOtfhRROASRwcT70qFczaxIKwVqWghMgJ3AImFc/Ouqdvk6ssUeQbP7yfnXN8OwVBKwRCkIJHOAIpJsfGgPDKT3x8alOFUgAeGJ3PK1NFYYpe1LIOoRJNiOUVEnBmVKIEkGDyne9btYewC7wZBn3GeFSstQSGU6ioCBtHWaGzPL1LXICYgC4FTl2DCQmLyDzpfiw8pUgJ2izhHui1MmgUyn94ORqVhwA7Gg++WB9Yx5VKHV8ztOw25+VLzGblRGKcQnka2RjEDn7KWJxSp+sf2QfhUhUs8Sf8I+VDmMPKQxGMb5H2VsnGpG0jypYpaxvPsA+FaodXwmhzGHlRHCc0jir2Ug7ak9+Fn/AIjev0LjhHuiida/7XvqDtsQRhTx7kA+kfEmsptyRnBKLoUZRi9GIZUBMLTbmCYI9hroWZ4ZAS4gAgFWvYHYGI5WVBPSuVtKKSCNwZHmNquTnbJUmUTa1+BAPLlFWnKUfpVkoQjJ+50O0upShKkTw5cetHY19EpMKASJvE+dutVNjtmobtztaRH3UyR2k/GpBbCNIEkKuZJjgOANQ15E94l3DG1tI9ydbbmHXiXgp11Lob8S/CARMhMRPu6U1weLZ0J+gTsPz18vOqtk7kM4hv8A5qVD0JHxphh3PAn+6Purq1HLovqWFOJw/wCrp/bX86mS/hv1cftr+dVvXWmIx6W0lSzAH8wOZragOBahiMN+rj9tde9/hv1cftrqhDti19hz93517/TJr7Dn7vzptxaRfe+w36v/AKiq0W9hv1f/AFFVR/6ZNfYc/d/3V4e2DX2HP3f91C2GkXUu4b9X/wBRVRqew36v/qH5VTT2ua+yv93/AHVqe1jX2V/u/OsakWR9jCk/1B9HD8q1bbwwP9Sf8w/7arKu1LX2V+wfOvcP2jaWoJ8SZ4qAj3GtbNpRZycP+hP+YflWfjjaU6EtkJnVHecQCAfq8ifbSrvK1KqXWPy0EOvtah9F6FUg3FiI5TVnzFtvAvJaQtwNFtKiFnXpKgTpTAFqp6EaloA3Kh99P/whvj8dWCYCQlM9UoAj3mllLYMYbiTGZ0EZh3iTYtFEmRZTak+e5qzduMROYNiYhLPhPCEmBaRx51zTMxLwIMiBfa/K9W7Oc0bexgeSsFPg87AT762rY2j3G3bJWp4TyFMWB9Fh/wC8j7qU9ocShxwKQZEUcxjUltpKTJSUyI5Uuopp2Ot9sz/8rcH9hI94rl+CzRoNNpUsAhCQRBsQBba9W3tZ2kZVgC3rhSgkAEK4EdK540oaU3BMDjFB5BYY7Hf5UZ+3+6r5Vr+VGf0g9h+VLUIn80ftCtxh+afeKXnfBTkLyHHMmvtj2H5V5+U2f0iaAHdnYexfyrUsdffW53wbkfIoTh0/aHtFbHDoO6vfWVlQtnRsYMOjgo1s20kfnq9v8aysrB2JUrgR3q/b/GsLv/MX/PrWVlLQ1kaif0q/WfnULgBI7whxI4KEmOQJkpvyrKymi66CSV9SPGYbDKHgaCL9T6UsxWW61p7mTICTKdKQqTx2iI3i9r7n2sq+OT3OfLFbELmRvpUEqSJVt4heneXZXo1AuFJJ+zytwPPnWVlacnosMIrmUQYvKFySh4Sd/rJn2Cl35FxA/wCMn/MX8qyspY5JdBp4o9TDlWIiO9TPPvHPl/M1C7kj6vrOoMc1qP3isrKopyJPHEj/AKPOfbR7T8q9/o479pv9r+FZWVubI3Kief0ce5p9p+Ve/wBG3v7PtPyrKykeeQ/p4Ho7Nvc0e0/Kth2Ze+03+0flWVlbnTNyIHo7Lvfaa/aPyrYdlXvtN/tH5VlZQeaYVggFI7PYzYOD9tf+2t09ncb+k/1FfKvayk58inp4/JPhsgxqVpV3qQQd+9M+nh3q04PLFgkvqS6smVKWSoz6isrKSeSUkNjxRiwlWXtHdtCvRPxTWquz2GJ/qW/2W/8AbWVlQ1NdGdGiL6ojf7P4f81DY/wp+CbV43kgH1A2OoCZ9hTWVlMpy8g5cfAxey5S29JV6hCJ9oFAN5CE8Uk/2kn5xWVlB5ZeQLFHwEowgFpT6V45liVb36aj91ZWUHKS7hUYvsRjJmxtKTzBNeIwyNtavUH4ivaynjJvuK4pdj//2Q=='),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Cafeteras',
                              style: TextStyle(fontSize: 18,
                                
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyPreferencesListCafeScreen()),
                      );
                    },
                     child: Card(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image : NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjXRwATF9VsXmkz6EAsv5hpDT_TMId6mCTA&s'),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Cafes',
                              style: TextStyle(fontSize: 18,
                                
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyPreferencesListSpiciesScreen()),
                      );
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image : NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREo7p9YUVYgSqgoAZY22CB5oPgSI7Hg-8XjA&s'),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Ingredientes Adicionales',
                              style: TextStyle(fontSize: 18,
                                
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyPreferencesListOtherScreen()),
                      );
                    },
                     child: Card(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image : NetworkImage('data:image/jpeg;base64,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'),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Otros',
                              style: TextStyle(fontSize: 18,
                                
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}