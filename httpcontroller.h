#ifndef QHTTPCONTROLLER_H
#define QHTTPCONTROLLER_H

#include <QObject>
#include <QNetworkAccessManager>
#include "mailmodel.h"
#include <QFile>
class HttpController : public QObject
{
    Q_OBJECT
public:
    explicit HttpController(QObject *parent = nullptr);
    QNetworkAccessManager * nam;
    QString m_accessToken; // полученный access_token
    MailModel *mail_model; // наша модель
    QString private_key; //получение секрета
    QString sigMd5; // получение хеша
    QString uid;
public slots:
    //void SlotFinished(QNetworkReply *reply);
    void getSiteValue();
    QString token(QString add);
    void restRequest();
    void hashMD5(QString add);
    void db_write();
    bool db_read();
signals:
    void toQML(QString reply, QString number);
    void toQML3(QString str1, QString str2);
    void toQML4();
    void toQML91(int online, int offline, int between);

protected:
    QObject *showHttp;
};

#endif // QHTTPCONTROLLER_H
