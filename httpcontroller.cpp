#include "httpcontroller.h"
#include <QNetworkRequest>
#include <QSslSocket>
#include <QNetworkReply>
#include <QEventLoop>
#include <windows.h>
#include <QUrl>
#include <QJsonDocument>
#include <QJsonArray>
#include <QtWidgets/QTableView>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlTableModel>
#include <QDesktopServices>
#include <QAuthenticator>
//#include <QOAuth2AuthorizationCodeFlow>
//#include <QOAuthHttpServerReplyHandler>
#include <QJsonObject>
#include <QCryptographicHash>
#include <mailmodel.h>

//HttpController::HttpController(QObject *QMLObject) : pocaz(QMLObject)
HttpController::HttpController(QObject *QMLObject) : showHttp(QMLObject)
{
   nam = new QNetworkAccessManager;
   mail_model = new MailModel();
  // connect(nam, &QNetworkAccessManager::finished, this, &HttpController::onNetworkValue);
   //connect(nam, &QNetworkAccessManager::finished,this, &HttpController::SlotFinished);
//    connect(nam, &QNetworkAccessManager::sslErrors,
//            this, [this](QNetworkReply *reply,
//                        const QList<QSslError> &errors)
//                {
//                    qDebug() << "***sslErrors()";
//                    for(auto err : errors)
//                    {
//                        qDebug() << err;
//                    }
//                });

}



void HttpController::getSiteValue()
{
    QNetworkRequest request;
    request.setUrl(QUrl("https://www.cbr.ru/currency_base/daily/")); //http://club-nissan.ru/forums https://www.gismeteo.ru/weather-moscow-4368/
    QNetworkReply * reply;
    QEventLoop evtloop;
    connect(nam, &QNetworkAccessManager::finished, &evtloop, &QEventLoop::quit);
    if(connect(nam, &QNetworkAccessManager::finished, &evtloop, &QEventLoop::quit)){qDebug() << "QNetworkAccessManager::finished success";}
    reply=nam->get(request);
    evtloop.exec(); //execution of the loop
    QString replystr = reply->readAll();
    QString tmp = replystr.left(1000);

    int j;
    QString usdnumber;
    j=replystr.indexOf("USD");
    j+=60;
    for (int i = 0; i < 30; i++){
        if ((replystr[j+i]<="9" && replystr[j+i]>="0") || (replystr[j+i] == ",")){
            usdnumber[i] = replystr[j+i];
        }
    }
    emit toQML(QString(tmp),usdnumber);
   // qDebug() << "Last symbol" <<replystr[j+15];
    //emit toQML2(temperature);

}
//void HttpController::onNetworkValue(QNetworkReply *reply)
//{ // парсинг сайта

//    QString str = reply->readAll(); // записывем в str наш сайт
//    //QObject* textField = pocaz->findChild<QObject*>("textField"); // ищем элемент textField, куда будем записывать
//    QObject* textFieldDate = pocaz->findChild<QObject*>("textFieldDate");
//    QObject* textArea = pocaz->findChild<QObject*>("textArea"); // ищем элемент textArea, откуда будем брать



//    textArea->setProperty("text", str); // задаем параметр "текст" для textArea из qml

//    int j = 0;

//    if((j = str.indexOf("mobile-indicator_courses", j)) != -1) // ищем индекс этого тега в тексте
//    {
//       // textField->setProperty("text", str.mid( j + 493,7)); // мы находим 493 символ после тега и отсчитываем 7 символов и их выводим (курс доллара) и записываем в textField
//       textFieldDate->setProperty("text", str.mid( j + 220,13)); // мы находим 220 символ после тега и отсчитываем 13 символов и их выводим (дату) и записываем в textFieldDate
//    }
//}
//void HttpController::getNetworkValue()
//{ // запрос к сайту

//    QNetworkRequest request;
//    request.setUrl(QUrl("https://cbr.ru/")); //https://cbr.ru/
//    qDebug() << request.url();
//    QNetworkReply * reply;
//    QEventLoop evntLoop;
//    connect(nam, &QNetworkAccessManager::finished, &evntLoop, &QEventLoop::quit);
//    reply = nam->get(request);
//    evntLoop.exec();// запуск цикла ожидания: приложение отрабатывает остальные сигналы, пока не наступит QEventLoop::quit
//    QString replyString = reply->readAll();
//    emit toQML(QString(replyString));
//    qDebug() << "getNetworkValue()";
//    qDebug() << reply->url()
//             << reply->rawHeaderList();

//}
QString HttpController::token(QString add)
{
    qDebug() << "до   ";
     //QString m_accessToken; //token;
     if(add.contains("fail=") || add.contains("access_token="))
     {
         if (add.contains("access_token=")) // если все успешно
         {
             qDebug() << "цикл 1   ";
             m_accessToken = add.split("access_token=")[1].split("&")[0]; // записываем наш access_token в переменную
             emit toQML3(add, m_accessToken);
             qDebug() << "после условия   ";
          qDebug() << "Access Token: " << m_accessToken;
             return m_accessToken;

         }
         else{
             emit toQML4();
             qDebug() << "No token (((";
         }
     }
     QString str = " ";
     return str;
     qDebug() << "конец  ";
}

void HttpController::hashMD5(QString add){
    qDebug() <<"вывод "<< add;
    if (add.indexOf("x_mailru_vid=") != -1) // условие если он найден то записать в переменну
        {
            uid = add.split("x_mailru_vid=")[1].split("&")[0];
            qDebug() << "uid" << uid;
            private_key = "4cef7c2f5084b5fe15745bc4e89e3877";
            qDebug() << "Наш приватный ключ: " << private_key;
            QString param = uid+ "aid=_myphotoapp_id=779246method=photos.getsession_key=" + m_accessToken + private_key;
            qDebug() << "Наш параметр" << param;
            QByteArray array;
            array.append(param);
            qDebug() << "Наш массив" << array;
            sigMd5 = QString(QCryptographicHash::hash((array),QCryptographicHash::Md5).toHex());
            qDebug() << "Наш хэш" << sigMd5;

        }
}

void HttpController::restRequest(){

    QEventLoop loop;
    nam = new QNetworkAccessManager();

    QObject::connect(nam, // связываем loop  с нашим менеджером
                     SIGNAL(finished(QNetworkReply*)),
                     &loop,
                     SLOT(quit()));

      qDebug() << "Наш токен REST: " << m_accessToken;
       qDebug() << "Наш хеш REST" << sigMd5;
    QNetworkReply *reply = nam->get(QNetworkRequest(QUrl( "http://www.appsmail.ru/platform/api?method=photos.get&app_id=779246&session_key="+m_accessToken+"&sig="+sigMd5+"&aid=_myphoto")));




     // qDebug() << "Наша nam" << nam;
    loop.exec();
   // QString photo(reply->readAll());

   //  qDebug() << "Наша URL-ka" << reply;
   //  qDebug() << "*** Список друзей в формате json ***" << photo;

//    // вся строка JSON с сервера грузится в QJsonDocument
      QJsonArray document = QJsonDocument::fromJson(reply->readAll()).array();

     qDebug() <<"Наш document"<< document;
    // QJsonObject root = document.object();
    //  qDebug() <<"Наш root"<< root;
    // QJsonValue itog = root.value("");
   //  qDebug() <<"Photos"<< itog;
      //  QJsonObject itog1 = itog.toObject();
       //qDebug() << itog1;
     // QJsonValue itog2 = itog1.value("items");
       //qDebug() << itog2;
     // QJsonArray smth = itog.toArray();
      //qDebug()<<"? что тут будет" << document;
     // Перебираем все элементы массива
       for(int i = 0; i < document.count(); i++){

        QJsonObject znach = document.at(i).toObject();
//       // Забираем значения свойств имени
         QString userid = znach.value("title").toString();
         qDebug() << userid;

//       // Забираем значения свойств фамилии
         QString textp = znach.value("comment").toString();
        qDebug() << textp;

//       // Забираем значения id
         int commentscount = znach.value("size").toInt();
         qDebug() << commentscount;

//       // Забираем ссылку на главное фото
         QUrl photo = znach.value("src").toString();
         qDebug() << photo;

      mail_model->addItem(MailObject (userid, textp, photo, commentscount ));
       qDebug()<<"yfi ger" << mail_model->Mailuserid;
        qDebug() << mail_model->Mailtextp;
       qDebug() << mail_model->MailPhoto;
       qDebug() << mail_model->Mailcommentscount;

   }
}
