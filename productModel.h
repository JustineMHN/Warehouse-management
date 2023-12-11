#ifndef PRODUCTMODEL_H
#define PRODUCTMODEL_H

#include <QObject>
#include <QString>
#include <QVariant>


class Product : public QObject
{
    Q_OBJECT
public:
    explicit Product(QObject *parent = nullptr);
    Product(const QString &code, const QString &name, const QString &description, int category, const QString &measure, double quantity, double price);

    Q_INVOKABLE void addNewProduct(QString m_code, QString m_name, QString m_description, int m_category, QString m_measure, double m_quantity, double m_price);

    QString code() const;
    void setCode(const QString &newCode);

    QString name() const;
    void setName(const QString &newName);

    QString description() const;
    void setDescription(const QString &newDescription);

    int category() const;
    void setCategory(int newCategory);

    QString measure() const;
    void setMeasure(const QString &newMeasure);

    double quantity() const;
    void setQuantity(double newQuantity);

    double price() const;
    void setPrice(double newPrice);

signals:
    void productAdded(QString m_code, QString m_name, QString m_description, int m_category, QString m_measure, double m_quantity, double m_price);
    void insertNewRow(QVariant newRow);

private:
    QString m_code;
    QString m_name;
    QString m_description;
    int m_category;
    QString m_measure;
    double m_quantity;
    double m_price;


};

#endif // PRODUCTMODEL_H
