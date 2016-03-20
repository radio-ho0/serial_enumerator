#ifndef MYMODEL_H
#define MYMODEL_H

#include <QAbstractListModel>

class SerialInfo{
public :
    SerialInfo(const QString& name,
               const QString& description  = QString(),
               const QString &busy         = QString(),
               const QString &sysLocatioon = QString(),
               const QString &manufacturer = QString(),
               const QString &serialNumber = QString(),
               const QString &vendor       = QString(),
               const QString &indentifier  = QString()
               );

    QString name()         const ;
    QString description()  const ;
    QString busy()         const ;
    QString sysLocation()  const ;
    QString manufacturer() const ;
    QString serialNumber() const ;
    QString vendor()       const ;
    QString indentifier()  const ;

private :
    QString m_name;
    QString m_description;
    QString m_busy;
    QString m_sysLocation;
    QString m_manufacturer;
    QString m_serialNumber;
    QString m_vendor;
    QString m_indentifier;

};

class MyModel : public QAbstractListModel
{
    Q_OBJECT

public:
    MyModel(QObject* parent = 0);

    enum SerialRoles {
        NAME_ROLE = Qt::UserRole + 1 ,
        DESCRIPTION_ROLE             ,
        BUSY_ROLE,
        SYSTEM_LOCATION_ROLE,
        MANUFACTURER_ROLE,
        SERIAL_NUMBER_ROLE,
        VENDOR_ROLE,
        INDENTIFIER_ROLE,

        THE_END
    };

    void addSerialInfo(const SerialInfo& serial);

    int rowCount(const QModelIndex &parent = QModelIndex()) const;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;

    Q_INVOKABLE void refreshModel();

protected :
    QHash<int, QByteArray> roleNames() const;

private:

    QList<SerialInfo> m_serials;
};

#endif // MYMODEL_H
