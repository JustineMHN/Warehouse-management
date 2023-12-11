#include "test.h"

Test::Test(QObject *parent)
    : QObject{parent}
{

}

QString Test::getName()
{
    return s_name;
}

int Test::getCgpe()
{
    return s_cgpe;
}

QString Test::getResult()
{
    return s_result;
}

void Test::works(QVariant data)
{
    bool ok;
    int numIn = data.toInt(&ok);
    int numOut = 0;

    if(!ok){
        qWarning() <<"Not a valid number";
    }
    else{
        int numRand = QRandomGenerator::global()->bounded(0,100);
        numOut = numIn * numRand;
        qInfo() << "In: " << numIn;
        qInfo() << "Random: " << numRand;
        qInfo() << "Out: " << numOut;
    }

    emit status(QVariant(numOut));
}

void Test::setName(QString name)
{
    if(s_name == name)
        return;
    s_name = name;
    emit nameChanged(s_name);
}

void Test::setCgpe(QVariant cgpe)
{
    bool ok;
    int num = cgpe.toInt(&ok);

    if(!ok){
        qWarning() <<"Not a valid number";
    }else{
        if(num < 0)
            num *= -1;
        if(s_cgpe == num)
            return;
        s_cgpe = num;
    }

    emit cgpeChanged(s_cgpe);
}

void Test::setResult()
{
    int res = s_cgpe;

        if(res < 10){
            s_result = "Failed";
        }
        else if(res >= 10 && res <=20){
            s_result = "Passed";
        }
        else if(res > 20){
            s_result = "cgpe cannot exceed 20";
        }

    emit resultChecked(s_result);
}
