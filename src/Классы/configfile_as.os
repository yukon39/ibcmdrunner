// BSLLS:NumberOfOptionalParams-off
// BSLLS:MagicNumber-off

Перем ПараметрыСервера;			// Соответствие - параметры секции server
Перем ПараметрыСервернойБазыДанных;	// Соответствие - параметры секции database
Перем ПараметрыФайловойБазыДанных;	// Соответствие - параметры секции database
Перем ПараметрыИБ;				// Соответствие - параметры секции infobase
Перем ПараметрыХТТП;			// Соответствие - параметры секции http
Перем ПараметрыВеб_Аутентификация;	// Соответствие - параметры секции auth
Перем ПараметрыВеб_Разделители;		// Соответствие - параметры секции zones
Перем ПараметрыВеб_Приложение;		// Соответствие - параметры секции application
Перем ПараметрыВеб_ПубликацияOData;	// Соответствие - параметры секции odata
Перем ПараметрыВеб_РежимПовторногоИспользованияСеансов;	// Соответствие - параметры секции reuse-sessions
Перем ПараметрыВебСервисовОбщие;	// Соответствие - параметры секции web-services
Перем ПараметрыВебСервисов;		// Соответствие - параметры секции service
Перем ПараметрыХТТПСервисовОбщие;	// Соответствие - параметры секции http-services
Перем ПараметрыХТТПСервисов;	// Соответствие - параметры секции service
Перем ПараметрыПубликацииДистрибутивов;	// Соответствие - параметры секции pubdst

Перем мсвПараметрыВеб_Разделители; 	// массив параметров Веб разделителей
Перем мсвПараметрыВебСервисов;		// массив параметров веб сервисов
Перем мсвПараметрыХТТПСервисов;		// массив параметров хттп-сервисов

Перем ПараметрыСпособовДоступаКСерверу; // Соответствие - параметры секции gates
Перем ПараметрыФункциональностиСервера; // Соответствие - параметры секции features
Перем ПараметрыОтладкиСервера; // Соответствие - параметры секции debug

#Область ПрограммныйИнтерфейс

// ПараметрыСервера
// 		Установка параметров автономного сервера
// Параметры:
// 	 Адрес - Строка - IP-адрес автономного сервера
//	 Порт - Число - Имя порта автономного сервера
//	 ИмяХоста - Строка - имя хоста (необязательный)
//
Процедура ПараметрыСервера(Адрес = "localhost",
	Порт = 8314,
	ИмяХоста = Неопределено) Экспорт

	ПараметрыСервера. Очистить();
	ПараметрыСервера.Вставить("port", Порт);
	ПараметрыСервера.Вставить("address", Адрес);
		
	Если ЗначениеЗаполнено(ИмяХоста) Тогда
		ПараметрыСервера.Вставить("host", ИмяХоста);
	КонецЕсли;	

КонецПроцедуры

// ПараметрыСервернойБД
// 		Установка параметров серверной автономной базы
// Параметры:
//	 ТипСУБД - Строка - тип СУБД
//	 Сервер - Строка - имя сервера или IP-адрес
//	 ИмяДБ - Строка - имя базы данных
//	 ИмяПользователя - Строка - имя пользователя серверной базы данных
//	 Пароль - Строка - пароль пользователя серверной базы данных
Процедура ПараметрыСервернойБД(ТипСУБД,
	Сервер,
	ИмяДБ,
	ИмяПользователя,
	Пароль) Экспорт

	ПараметрыСервернойБазыДанных.Очистить();
	ПараметрыФайловойБазыДанных.Очистить();
	ПараметрыСервернойБазыДанных.Вставить("dbms", ТипСУБД);
	ПараметрыСервернойБазыДанных.Вставить("server", Сервер);
	ПараметрыСервернойБазыДанных.Вставить("name", ИмяДБ);
	ПараметрыСервернойБазыДанных.Вставить("user", ИмяПользователя);
	ПараметрыСервернойБазыДанных.Вставить("password", Пароль);
	
КонецПроцедуры

// ПараметрыФайловойБД
// 		Установка параметров файловой БД
// Параметры:
//	 ПутьКФайлуИБ - Строка - Путь к файлу информационной базы.
//
Процедура ПараметрыФайловойБД(ПутьКФайлуИБ) Экспорт

	ПараметрыФайловойБазыДанных.Вставить("path", ПутьКФайлуИБ);
	
КонецПроцедуры

// ПараметрыИБ
// 		Установка параметров информационной базы
// Параметры:
//	 ИмяИБ - Строка - имя информационной базы
//	 ВыдаватьКлиентскиеЛицензии - Булево - разрешить выдавать клиентские лицензии автономному серверу
//	 РазрешитьРегламентныеЗадания - Булево - разрешить выполнение регламентных заданий
//	 ИД - Строка - уникальный идентификатор информационной базы. По умолчанию - значение unique, то есть
//		каждый раз при перезапуске будет генерироваться новый уникальный идентификатор. 
Процедура ПараметрыИБ(ИмяИБ,
	ВыдаватьКлиентскиеЛицензии,
	РазрешитьРегламентныеЗадания,
	ИД = "unique") Экспорт

	ПараметрыИБ.Очистить();
	ПараметрыИБ.Вставить("id", ИД);
	ПараметрыИБ.Вставить("name", ИмяИБ);
	ПараметрыИБ.Вставить("distribute-licenses", ВыдаватьКлиентскиеЛицензии);
	ПараметрыИБ.Вставить("shedule-jobs", РазрешитьРегламентныеЗадания);

КонецПроцедуры

// ПараметрыХТТП
// 		Установка параметров веб-доступа к информационной базе.
// Параметры:
//	 БазовыйУРЛ - Строка - Базовый путь доступа к информационной базе с помощью веб-сервера.
//		 К одной информационной базе можно организовать несколько публикаций,
//		 которые отличаются базовыми путями и другими параметрами публикации.
// 		Значение по умолчанию:/.
Процедура ПараметрыХТТП(БазовыйУРЛ = "/") Экспорт

	ПараметрыХТТП.Очистить();
	ПараметрыХТТП.Вставить("base", БазовыйУРЛ);
КонецПроцедуры	

// ПараметрыВеб_Аутентификация
// 		Установка параметров веб-аутентификации OpenId (секции rely и provider)
// Параметры:
//	 УРИПровайдера - Строка - указывает URL информационной базы «1С:Предприятия», выступающей в роли OpenID-провайдера.
//	 ВремяЖизни - Число - время жизни признака аутентифицированности идентификатора в секундах.
//		 Значение по умолчанию - 86400 секунд.
//	 МаскаРазрешенныхИмен - Строка - представляет собой регулярное выражение, которое определяет
//		 маску разрешенных имен сайтов, на которые могут выполняться переадресации пользовательского
//		 веб-браузера (параметр запроса openid.return_to) после исполнения команды OpenID-провайдера.
//	 ПровайдерыOpenIDConnect - Строка - данный элемент содержит описание внешних OpenID-провайдеров,
//		 поддерживающих протокол авторизации OpenID Connect v1.0 (http://openid.net/connect/).
//		 Описание представляет собой массив объектов, каждый из которых описывает одного
//		 OpenID-провайдера. Массив представлен в виде JSON-сериализации.
//		 Подробнее см. https://its.1c.ru/db/v8314doc#bookmark:adm:TI000000847
//  РазрешитьАутентификацию1С - Булево -указывает возможность применения аутентификации «1С:Предприятия».  
Процедура ПараметрыВеб_Аутентификация(УРИПровайдера,
	ВремяЖизни = 86400,
	МаскаРазрешенныхИмен = Неопределено,
	ПровайдерыOpenIDConnect = Неопределено,
	РазрешитьАутентификацию1С = Истина) Экспорт

	ПараметрыВеб_Аутентификация.Очистить();
	ПараметрыВеб_Аутентификация.Вставить("url", УРИПровайдера);
	ПараметрыВеб_Аутентификация.Вставить("lifetime", ВремяЖизни);
	ПараметрыВеб_Аутентификация.Вставить("return-to", МаскаРазрешенныхИмен);
	ПараметрыВеб_Аутентификация.Вставить("providers", ПровайдерыOpenIDConnect);
	ПараметрыВеб_Аутентификация.Вставить("allow-standart", РазрешитьАутентификацию1С);

КонецПроцедуры

// ДобавитьПараметрыВеб_Разделители
// 		Добавление параметров разделителя в массив параметров разделителей ИБ.
// 		Массив параметров разделителей содержит описание разделителей для базового
// 		каталога доступа. Если прикладное решение содержит несколько разделителей,
// 		данная секция может содержать несколько записей. Каждая запись описывает параметры
// 		одного разделителя в порядке их (разделителей) следования в метаданных.
// Параметры:
//	 Разделитель - Строка - явное указание значения разделителя, который находится на этой позиции.
//	 РазрешитьИзменение - Булево - Параметр управляет возможностью изменения значения
//		 разделителя из кода прикладного решения.
//	 ДобавлятьЗначениеВАдрес - Булево - определяет необходимость присутствия значения
//		 данного разделителя в адресе публикуемой информационной базы
//	 ЭтоПервоеЗначениеРазделителя - Булево - флаг для инициализации массива параметров.
Процедура ДобавитьПараметрыВеб_Разделители(Разделитель,
	РазрешитьИзменение = Ложь,
	ДобавлятьЗначениеВАдрес = Ложь,
	ЭтоПервоеЗначениеРазделителя = Истина) Экспорт

	ПараметрыВеб_Разделители.Очистить();
	ПараметрыВеб_Разделители.Вставить("value", Разделитель);
	ПараметрыВеб_Разделители.Вставить("safe", РазрешитьИзменение);
	ПараметрыВеб_Разделители.Вставить("specify", ДобавлятьЗначениеВАдрес);
	
	Если ЭтоПервоеЗначениеРазделителя Тогда
		мсвПараметрыВеб_Разделители = Новый Массив;
	КонецЕсли;	
	мсвПараметрыВеб_Разделители.Добавить(ПараметрыВеб_Разделители);

КонецПроцедуры

// ПараметрыВеб_Приложение
// 		Установка параметров публикации управляемого приложения (application)
// Параметры:
//	 УРИВозврата - Строка - адрес (URL), по которому будет выполнен переход после завершения работы веб-клиента.
//	 Публиковать - Булево - Определяет возможность использовать клиентское приложение для доступа 
//		к информационной базе.
Процедура ПараметрыВеб_Приложение(УРИВозврата, Публиковать = Истина) Экспорт
	ПараметрыВеб_Приложение = Новый Соответствие;
	ПараметрыВеб_Приложение.Вставить("publish", Публиковать);
	ПараметрыВеб_Приложение.Вставить("exit-url", УРИВозврата);
КонецПроцедуры 

// ПараметрыВеб_ПубликацияOData
//		Установка параметров публикации интерфейса OData
// Параметры:
//	 Публиковать - Булево - Управляет доступностью стандартного интерфейса OData через указанную публикацию.
//	 ПараметрыРежимаПовторногоИспользованияСеансов - Соответствие - параметры режима повторного
//		использования сеансов (см. описание следующего метода).
Процедура ПараметрыВеб_ПубликацияOData(Публиковать = Ложь,
	ПараметрыРежимаПовторногоИспользованияСеансов = Неопределено) Экспорт

	ПараметрыВеб_ПубликацияOData.Очистить();
	ПараметрыВеб_ПубликацияOData.Вставить("publish", Публиковать);
	Если ПараметрыРежимаПовторногоИспользованияСеансов <> Неопределено Тогда
		ПараметрыВеб_ПубликацияOData.Вставмит("reuse-sessions", ПараметрыРежимаПовторногоИспользованияСеансов);
	КонецЕсли;

КонецПроцедуры	

// ПараметрыВеб_РежимПовторногоИспользованияСеансов
// 		Устанавливает параметры повторного использования сеансов
// Параметры:
//	 Режим - Строка - AutoUse, DontUse, Use
//	 ВремяБездействия - Число -Время бездействия сеанса, после которого он завершается принудительно (в секундах).
//	 МаксимальноеКоличествоСеансов - Число - Максимальное количество сеансов, которые могут быть созданы при
//		автоматическом управлении сеансами. 
//	 ТаймаутОжиданияСвободногоСеанса - Число - Время ожидания появления свободного сеанса после заполнения
//		пула сеансов (в секундах).
Процедура ПараметрыВеб_РежимПовторногоИспользованияСеансов(Режим = "AutoUse", 
	ВремяБездействия = 20, 
	МаксимальноеКоличествоСеансов = 10,
	ТаймаутОжиданияСвободногоСеанса = 5) Экспорт

	ПараметрыВеб_РежимПовторногоИспользованияСеансов.Очистить();
	ПараметрыВеб_РежимПовторногоИспользованияСеансов.Вставить("mode", Режим);
	ПараметрыВеб_РежимПовторногоИспользованияСеансов.Вставить("max-age", ВремяБездействия);
	ПараметрыВеб_РежимПовторногоИспользованияСеансов.Вставить("pool-size", МаксимальноеКоличествоСеансов);
	ПараметрыВеб_РежимПовторногоИспользованияСеансов.Вставить("pool-timeout", ТаймаутОжиданияСвободногоСеанса);

КонецПроцедуры

// ПараметрыВебСервисовОбщие
// 		Устанавливает параметры доступа к Web-сервисам, которые реализованы в прикладном решении.
// Параметры:
//	 ПубликоватьВебСервисы - Булево - определяет доступность Web-сервисов приложения
//	 ПубликоватьВебСервисыРасширений - Булево - определяет доступность Web-сервисов расширений приложения
Процедура ПараметрыВебСервисовОбщие(ПубликоватьВебСервисы = Истина,
	ПубликоватьВебСервисыРасширений = Ложь) Экспорт

	ПараметрыВебСервисовОбщие.Очистить();
	ПараметрыВебСервисовОбщие.Вставить("publish-by-default", ПубликоватьВебСервисы);
	ПараметрыВебСервисовОбщие.Вставить("publish-extensions-by-default", ПубликоватьВебСервисыРасширений);

КонецПроцедуры

// ДобавитьПараметрыВебСервиса
// 		Добавление в массив параметров отдельного web-сервиса
// Параметры:
//	 Публиковать - Булево - необходимость публикации сервиса
//	 Имя - Строка - имя сервисв
//	 Синоним - Строка - точка подключения сервиса
//	 ПараметрыПовторногоИспользования - Строка - параметры режима
//		повторного использования сеансов. Если параметр пропущен, то
//		это эквивалентно следующим значениям, установленным по умолчанию:
//		mode: AutoUse
//		max-age: 20s
//		pool-size: 10
//		pool-timeout: 5s
//		Подробности: https://its.1c.ru/db/v8314doc#bookmark:adm:TI000000940
//	 ЭтоПервыйСервис - Булево - флаг для инициализации массива web-сервисов 
Процедура ДобавитьПараметрыВебСервиса(Публиковать,
	Имя,
	Синоним,
	ПараметрыПовторногоИспользования,
	ЭтоПервыйСервис) Экспорт

	ПараметрыВебСервисов = Новый Соответствие;
	ПараметрыВебСервисов.Вставить("publish", Публиковать);
	ПараметрыВебСервисов.Вставить("name", Имя);
	ПараметрыВебСервисов.Вставить("alias", Синоним);
	ПараметрыВебСервисов.Вставить("reuse-sessions", ПараметрыПовторногоИспользования);

	Если ЭтоПервыйСервис Тогда
		мсвПараметрыВебСервисов = Новый Массив;
	КонецЕсли;
	мсвПараметрыВебСервисов.Добавить(ПараметрыВебСервисов);

КонецПроцедуры

// ПараметрыХТТПСервисовОбщие
// 		Устанавливает параметры доступа к http-сервисам, которые реализованы в прикладном решении.
// Параметры:
//	 ПубликоватьХТТПСервисы - Булево - определяет доступность http-сервисов приложения
//	 ПубликоватьХТТПСервисыРасширений - Булево - определяет доступность http-сервисов расширений приложения
Процедура ПараметрыХТТПСервисовОбщие(ПубликоватьХТТПСервисы = Истина,
	ПубликоватьХТТПСервисыРасширений = Ложь) Экспорт

	ПараметрыХТТПСервисовОбщие.Очистить();
	ПараметрыХТТПСервисовОбщие.Вставить("publish-by-default", ПубликоватьХТТПСервисы);
	ПараметрыХТТПСервисовОбщие.Вставить("publish-extensions-by-default", ПубликоватьХТТПСервисыРасширений);

КонецПроцедуры

// ДобавитьПараметрыХТТПСервиса
//  	Добавление в массив параметров отдельного http-сервиса
// Параметры:
//	 Публиковать - Булево - необходимость публикации сервиса
//	 Имя - Строка - имя сервисв
//	 КорневойУРЛ - Строка - точка подключения сервиса
//	 ПараметрыПовторногоИспользования - Строка - параметры режима
//		повторного использования сеансов. Если параметр пропущен, то
//		это эквивалентно следующим значениям, установленным по умолчанию:
//		mode: AutoUse
//		max-age: 20s
//		pool-size: 10
//		pool-timeout: 5s
//		Подробности: https://its.1c.ru/db/v8314doc#bookmark:adm:TI000000940
//	 ЭтоПервыйСервис - Булево - флаг для инициализации массива http-сервисов 
Процедура ДобавитьПараметрыХТТПСервиса(Публиковать,
	Имя,
	КорневойУРЛ,
	ПараметрыПовторногоИспользования = Неопределено,
	ЭтоПервыйСервис = Ложь) Экспорт

	ПараметрыХТТПСервисов = Новый Соответствие;
	ПараметрыХТТПСервисов.Вставить("publish", Публиковать);
	ПараметрыХТТПСервисов.Вставить("name", Имя);
	ПараметрыХТТПСервисов.Вставить("root", КорневойУРЛ);
	ПараметрыХТТПСервисов.Вставить("reuse-sessions", ПараметрыПовторногоИспользования);

	Если ЭтоПервыйСервис Тогда
		мсвПараметрыХТТПСервисов = Новый Массив;
	КонецЕсли;
	мсвПараметрыВебСервисов.Добавить(ПараметрыХТТПСервисов);

КонецПроцедуры

// ПараметрыПубликацииДистрибутивов
// 		Устанавливает параметры публикации клиентских дистрибутивов (pubdst)
// Параметры:
//	 ПутьКФайлуВин32 - Строка - Полное имя файла с архивом дистрибутива
//		 32-разрядного клиентского приложения для ОС Windows. 
//	 ПутьКФайлуВин64 - Строка - Полное имя файла с архивом дистрибутива
//		 64-разрядного клиентского приложения для ОС Windows.
//	 ПутьКФайлуМак64 - Строка - Полное имя файла с архивом дистрибутива
//		 64-разрядного клиентского приложения для ОС macOS.
Процедура ПараметрыПубликацииДистрибутивов(ПутьКФайлуВин32, ПутьКФайлуВин64, ПутьКФайлуМак64) Экспорт

	ПараметрыПубликацииДистрибутивов.Очистить();
	ПараметрыПубликацииДистрибутивов.Вставить("win32", ПутьКФайлуВин32);
	ПараметрыПубликацииДистрибутивов.Вставить("win64", ПутьКФайлуВин64);
	ПараметрыПубликацииДистрибутивов.Вставить("mac64", ПутьКФайлуМак64);

КонецПроцедуры

// Параметры доступа к информационной базе по протоколу TCP/IP (с помощью прямого подключения).
//
// Параметры:
//   ОсновнойПорт - Число - Основной сетевой порт установки прямого соединения с сервером
//   МинимальныйПортПодключения - Число - Нижняя граница диапазона портов для установки соединения
//   МаксимальныйПортПодключения - Число - Верхняя граница диапазона портов для установки соединения
//   УровеньБезопасности - Число - Уровень безопасности прямого соединения с сервером
//
Процедура ПараметрыШлюзаПрямогоДоступа(ОсновнойПорт = 1541, 
	МинимальныйПортПодключения = 1560, 
	МаксимальныйПортПодключения = 1591, 
	УровеньБезопасности = 0) Экспорт

	ПараметрыШлюза = Новый Соответствие;
	ПараметрыШлюза.Вставить("regport", XMLСтрока(ОсновнойПорт));
	ПараметрыШлюза.Вставить("range", 
		СтрШаблон("%1:%2", XMLСтрока(МинимальныйПортПодключения), XMLСтрока(МаксимальныйПортПодключения)));
	ПараметрыШлюза.Вставить("seclevel", XMLСтрока(УровеньБезопасности));

	ПараметрыСпособовДоступаКСерверу.Вставить("direct", ПараметрыШлюза);

КонецПроцедуры

// Параметры доступа к информационной базе по протоколу SSH.
//
// Параметры:
//   СетевойИнтерфейс - Строка - Сетевой интерфейс, который используется шлюзом.
//   ПутьКЗакрытомуКлючу - Строка - Путь к закрытому ключу хоста.
//   ПортПодключения - Число - Порт, обслуживаемый данным шлюзом.
//
Процедура ПараметрыШлюзаSSH(СетевойИнтерфейс = "localhost", 
	ПутьКЗакрытомуКлючу = "auto", 
	ПортПодключения = 8282) Экспорт

	ПараметрыШлюза = Новый Соответствие;
	ПараметрыШлюза.Вставить("address", СетевойИнтерфейс);
	ПараметрыШлюза.Вставить("host-key", ПутьКЗакрытомуКлючу);
	ПараметрыШлюза.Вставить("port", XMLСтрока(ПортПодключения));

	ПараметрыСпособовДоступаКСерверу.Вставить("ssh", ПараметрыШлюза);
	
КонецПроцедуры

// Параметры функциональных характеристик автономного сервера.
//
// Параметры:
//   ИспользоватьШлюзПрямогоДоступа - Булево, Неопределено - использовать доступ 
//		по протоколу TCP/IP (прямое подключение).
//   ИспользоватьШлюзHTTP - Булево, Неопределено - использовать доступ к автономному серверу по протоколу HTTP.
//   ИспользоватьШлюзSSH - Булево, Неопределено - использовать доступ к автономному серверу по протоколу SSH.
//   ИспользоватьРасширеннуюФункциональностьКонифгуратора - Булево, Неопределено - использовать расширенную 
//		функциональность Конфигуратора.
//
Процедура ПараметрыФункциональностиСервера(ИспользоватьШлюзПрямогоДоступа = Неопределено,
		ИспользоватьШлюзHTTP = Неопределено,
		ИспользоватьШлюзSSH = Неопределено,
		ИспользоватьРасширеннуюФункциональностьКонифгуратора = Неопределено) Экспорт

	ТипБулево = Тип("Булево");

	Если ТипЗнч(ИспользоватьШлюзПрямогоДоступа) = ТипБулево Тогда
		ПараметрыФункциональностиСервера.Вставить("direct-gate", ИспользоватьШлюзПрямогоДоступа);
	КонецЕсли;

	Если ТипЗнч(ИспользоватьШлюзHTTP) = ТипБулево Тогда
		ПараметрыФункциональностиСервера.Вставить("http-gate", ИспользоватьШлюзHTTP);
	КонецЕсли;

	Если ТипЗнч(ИспользоватьШлюзSSH) = ТипБулево Тогда
		ПараметрыФункциональностиСервера.Вставить("ssh-gate", ИспользоватьШлюзSSH);
	КонецЕсли;

	Если ТипЗнч(ИспользоватьРасширеннуюФункциональностьКонифгуратора) = ТипБулево Тогда
		ПараметрыФункциональностиСервера.Вставить("extended-designer-features", 
			ИспользоватьРасширеннуюФункциональностьКонифгуратора);
	КонецЕсли;
	
КонецПроцедуры

// Параметры отладки текущего экземпляра автономномного сервера
//
// Параметры:
//   ТипОтладки - Строка - Режим работы отладчика. (none|tcp|http)
//   ПортОтладки - Число - Сетевой порт, обслуживаемый сервером отладки
//   СетевойИнтерфейс - Строка - IP-адрес, обслуживаемый сервером для отладки
//   ПарольОтладки - Строка - Пароль для доступа к серверу отладки.
//
Процедура ПараметрыОтладкиСервера(ТипОтладки = "none",
	ПортОтладки = 1550,
	СетевойИнтерфейс = "localhost",
	ПарольОтладки = "") Экспорт

	ПараметрыОтладкиСервера.Вставить("type", ТипОтладки);
	ПараметрыОтладкиСервера.Вставить("port", XMLСтрока(ПортОтладки));
	ПараметрыОтладкиСервера.Вставить("address", СетевойИнтерфейс);

	Если ЗначениеЗаполнено(ПарольОтладки) Тогда
		ПараметрыОтладкиСервера.Вставить("password", ПарольОтладки);
	КонецЕсли;

КонецПроцедуры

// Параметры внешнего сервера отладки
//
// Параметры:
//   АдресВнешнегоСервераОтладки - Строка - Адрес внешнего сервера отладки.
//
Процедура ПараметрыВнешнегоСервераОтладки(АдресВнешнегоСервераОтладки) Экспорт
	
	ПараметрыВнешнегоСервера = Новый Соответствие;
	ПараметрыВнешнегоСервера.Вставить("url", АдресВнешнегоСервераОтладки);
	
	ПараметрыОтладкиСервера.Вставить("type", "server");
	ПараметрыОтладкиСервера.Вставить("server", ПараметрыВнешнегоСервера);

КонецПроцедуры

// СоздатьКонфигурационныйФайл
// 		Создание конфигурационного файла по ранее заполненным параметрам
// Параметры:
//	 ПутьКФайлу - Строка - полный путь к конфигурационному файлу
Процедура СоздатьКонфигурационныйФайл(ПутьКФайлу) Экспорт

	Конфиг = Новый ЗаписьТекста(ПутьКФайлу, "UTF-8");
	
	ЗаписатьПараметрыСервера(Конфиг);
	ЗаписатьПараметрыБазыДанных(Конфиг);
	ЗаписатьПараметрыИнформационнойБазы(Конфиг);
	ЗаписатьПараметрыВебДоступа(Конфиг);
	ЗаписатьПараметрыСпособовДоступаКСерверу(Конфиг);
	ЗаписатьПараметрыФункциональностиСервера(Конфиг);
	ЗаписатьПараметрыОтладкиСервера(Конфиг);

	Конфиг.Закрыть();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытий

Процедура ПриСозданииОбъекта()

	ПараметрыСервера = Новый Соответствие;
	ПараметрыСервернойБазыДанных = Новый Соответствие;
	ПараметрыФайловойБазыДанных = Новый Соответствие;
	ПараметрыИБ = Новый Соответствие;
	ПараметрыВеб_Аутентификация = Новый Соответствие;
	ПараметрыВеб_Разделители = Новый Соответствие;
	ПараметрыВеб_ПубликацияOData = Новый Соответствие;
	ПараметрыВеб_РежимПовторногоИспользованияСеансов = Новый Соответствие;
	ПараметрыВебСервисовОбщие = Новый Соответствие;
	ПараметрыВебСервисов = Новый Соответствие;
	ПараметрыХТТП = Новый Соответствие;
	ПараметрыХТТПСервисовОбщие = Новый Соответствие;
	ПараметрыХТТПСервисов = Новый Соответствие;
	ПараметрыПубликацииДистрибутивов = Новый Соответствие;
	мсвПараметрыВеб_Разделители = Новый Соответствие;
	мсвПараметрыВебСервисов = Новый Соответствие;
	мсвПараметрыХТТПСервисов = Новый Соответствие;
	ПараметрыСпособовДоступаКСерверу = Новый Соответствие;
	ПараметрыФункциональностиСервера = Новый Соответствие;
	ПараметрыОтладкиСервера = Новый Соответствие;

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ЗаполнитьСекцию(КонфигФайл, Параметры, Уровень = 1)
	
	Если Параметры.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;
	
	Отступ = "";
	Для Счетчик = 1 По Уровень Цикл // BSLLS:UnusedLocalVariable-off
		Отступ = Отступ + "  ";
	КонецЦикла;

	Для Каждого Параметр Из Параметры Цикл
		ТипЗнчПараметра = ТипЗнч(Параметр.Значение);

		Если ТипЗнчПараметра = Тип("Число") ИЛИ
			ТипЗнчПараметра = Тип("Строка") Тогда
			Значение = Параметр.Значение;
		ИначеЕсли ТипЗнчПараметра = Тип("Булево") Тогда
			Значение = БулевоВСтроку(Параметр.Значение); 

		ИначеЕсли ТипЗнчПараметра = Тип("Соответствие") Тогда
			КонфигФайл.ЗаписатьСтроку(СтрШаблон("%1%2:", Отступ, Параметр.Ключ));
			ЗаполнитьСекцию(КонфигФайл, Параметр.Значение, Уровень + 1);
			Продолжить;

		Иначе
			ВызватьИсключение "Значение параметра имеет неизвестный тип";
		КонецЕсли;	

		Строка = СтрШаблон("%1%2: %3", Отступ, Параметр.Ключ, Значение);
		КонфигФайл.ЗаписатьСтроку(Строка);
	
	КонецЦикла;	
	
КонецПроцедуры	

Функция БулевоВСтроку(Значение)
	Если Значение = Истина Тогда
		Рез = "true";
	ИначеЕсли Значение = Ложь Тогда
		Рез = "false";
	Иначе
		ВызватьИсключение "Значение должно иметь тип Булево.";
	КонецЕсли;
	Возврат Рез;			
КонецФункции	

Процедура ЗаписатьПараметрыСервера(Конфиг)

	Если ПараметрыСервера.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;

	Конфиг.ЗаписатьСтроку("server:");
	ЗаполнитьСекцию(Конфиг, ПараметрыСервера);

КонецПроцедуры

Процедура ЗаписатьПараметрыБазыДанных(Конфиг)

	Если ПараметрыСервернойБазыДанных.Количество() = 0 И ПараметрыФайловойБазыДанных.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;

	Конфиг.ЗаписатьСтроку("database:");

	Для Каждого Параметр Из ПараметрыСервернойБазыДанных Цикл
		Строка = СтрШаблон("  %1: %2", Параметр.Ключ, Параметр.Значение);
		Конфиг.ЗаписатьСтроку(Строка);
	КонецЦикла;	

	Для Каждого Параметр Из ПараметрыФайловойБазыДанных Цикл
		Строка = СтрШаблон("  %1: %2", Параметр.Ключ, Параметр.Значение);
		Конфиг.ЗаписатьСтроку(Строка);
	КонецЦикла;	

КонецПроцедуры

Процедура ЗаписатьПараметрыИнформационнойБазы(Конфиг)

	Если ПараметрыИБ.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;

	Конфиг.ЗаписатьСтроку("infobase:");
	ЗаполнитьСекцию(Конфиг, ПараметрыИБ);

КонецПроцедуры

Процедура ЗаписатьПараметрыВебДоступа(Конфиг)

	ПропуститьСекциюHTTP = ПараметрыХТТП.Количество() = 0 
		И ПараметрыВеб_Аутентификация.Количество() = 0
		И мсвПараметрыВеб_Разделители.Количество() = 0
		И ПараметрыВеб_ПубликацияOData.Количество() = 0
		И ПараметрыВебСервисовОбщие.Количество() = 0
		И ПараметрыХТТПСервисовОбщие.Количество() = 0
		И ПараметрыПубликацииДистрибутивов.Количество() = 0;

	Если ПропуститьСекциюHTTP Тогда
		Возврат;
	КонецЕсли;

	Конфиг.ЗаписатьСтроку("http:");
	ЗаписатьПараметрыВеб_ХТТП(Конфиг);
	ЗаписатьПараметрыВеб_Аутентификация(Конфиг);
	ЗаписатьПараметрыВеб_Разделители(Конфиг);
	ЗаписатьПараметрыВеб_ПубликацияOData(Конфиг);
	ЗаписатьПараметрыВеб_ВебСервисов(Конфиг);
	ЗаписатьПараметрыВеб_ХТТПСервисов(Конфиг);
	ЗаписатьПараметрыВеб_ПубликацииДистрибутивов(Конфиг);
	
КонецПроцедуры

Процедура ЗаписатьПараметрыВеб_ХТТП(Конфиг) 

	Если ПараметрыХТТП.Количество() > 0 Тогда
		ЗаполнитьСекцию(Конфиг, ПараметрыХТТП);
	КонецЕсли;

КонецПроцедуры

Процедура ЗаписатьПараметрыВеб_Аутентификация(Конфиг)
	
	Если ПараметрыВеб_Аутентификация.Количество() > 0 Тогда
		Конфиг.ЗаписатьСтроку("  auth:");
		Конфиг.ЗаписатьСтроку("    rely:");
		Значение = ПараметрыВеб_Аутентификация.Получить("url");
		Конфиг.ЗаписатьСтроку("      url: " + Значение);
		Значение = ПараметрыВеб_Аутентификация.Получить("lifetime");
		Конфиг.ЗаписатьСтроку("      lifetime: " + Значение);
		Конфиг.ЗаписатьСтроку("    provider:");
		Значение = ПараметрыВеб_Аутентификация.Получить("return-to");
		Если Значение <> Неопределено Тогда
			Конфиг.ЗаписатьСтроку("      return-to: " + Значение);
		КонецЕсли;	
		Значение = ПараметрыВеб_Аутентификация.Получить("providers");
		Если Значение <> Неопределено Тогда
			Конфиг.ЗаписатьСтроку("      providers: " + Значение);
		КонецЕсли;
		Значение = ПараметрыВеб_Аутентификация.Получить("allow-standard");
		Если Значение = Ложь Тогда
			Конфиг.ЗаписатьСтроку("      allow-standard: false");
		КонецЕсли;	
	КонецЕсли;	

КонецПроцедуры

Процедура ЗаписатьПараметрыВеб_Разделители(Конфиг)
	
	Если мсвПараметрыВеб_Разделители.Количество() > 0 Тогда
		Конфиг.ЗаписатьСтроку("  zones:");
		Для Каждого Разделитель Из мсвПараметрыВеб_Разделители Цикл
			Конфиг.ЗаписатьСтроку("   -");
			ЗаполнитьСекцию(Конфиг, Разделитель, 3);
		КонецЦикла;	
	КонецЕсли;	

КонецПроцедуры

Процедура ЗаписатьПараметрыВеб_ПубликацияOData(Конфиг)
	
	Если ПараметрыВеб_ПубликацияOData.Количество() > 0 Тогда
		Конфиг.ЗаписатьСтроку("  odata:");
		Значение = ПараметрыВеб_ПубликацияOData.Получить("publish");
		Если Значение <> Неопределено Тогда
			Конфиг.ЗаписатьСтроку("    publish: " + БулевоВСтроку(Значение));
		КонецЕсли;
		Значение = ПараметрыВеб_ПубликацияOData.Получить("reuse-session");
		Если Значение <> Неопределено Тогда
			Конфиг.ЗаписатьСтроку("    reuse-session:");
			ЗаполнитьСекцию(Конфиг, Значение, 3);
		КонецЕсли;		
	КонецЕсли;

КонецПроцедуры

Процедура ЗаписатьПараметрыВеб_ВебСервисов(Конфиг)

	Если ПараметрыВебСервисовОбщие.Количество() > 0 Тогда
		Конфиг.ЗаписатьСтроку("  web-services:");
		ЗаполнитьСекцию(Конфиг, ПараметрыВебСервисовОбщие, 2);
		Если мсвПараметрыВебСервисов.Количество() > 0 Тогда
			Конфиг.ЗаписатьСтроку("    service:");
			Для Каждого ПараметрыВебСервиса Из мсвПараметрыВебСервисов Цикл
				Конфиг.ЗаписатьСтроку("    -");
				ЗаполнитьСекцию(Конфиг, ПараметрыВебСервиса, 3);
			КонецЦикла;	
		КонецЕсли;	
	КонецЕсли;	
	
КонецПроцедуры

Процедура ЗаписатьПараметрыВеб_ХТТПСервисов(Конфиг)
	
	Если ПараметрыХТТПСервисовОбщие.Количество() > 0 Тогда
		Конфиг.ЗаписатьСтроку("  http-services:");
		ЗаполнитьСекцию(Конфиг, ПараметрыХТТПСервисовОбщие, 2);
		Если мсвПараметрыХТТПСервисов.Количество() > 0 Тогда
			Конфиг.ЗаписатьСтроку("    service:");
			Для Каждого ПараметрыХТТПСервиса Из мсвПараметрыХТТПСервисов Цикл
				Конфиг.ЗаписатьСтроку("    -");
				ЗаполнитьСекцию(Конфиг, ПараметрыХТТПСервиса, 3);
			КонецЦикла;	
		КонецЕсли;	
	КонецЕсли;	

КонецПроцедуры

Процедура ЗаписатьПараметрыВеб_ПубликацииДистрибутивов(Конфиг)
	
	Если ПараметрыПубликацииДистрибутивов.Количество() > 0 Тогда
		Конфиг.ЗаписатьСтроку("  pubdst:");
		ЗаполнитьСекцию(Конфиг, ПараметрыПубликацииДистрибутивов, 2);
	КонецЕсли;	

КонецПроцедуры

Процедура ЗаписатьПараметрыСпособовДоступаКСерверу(Конфиг)

	Если ПараметрыСпособовДоступаКСерверу.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;

	Конфиг.ЗаписатьСтроку("gates:");
	ЗаполнитьСекцию(Конфиг, ПараметрыСпособовДоступаКСерверу);

КонецПроцедуры

Процедура ЗаписатьПараметрыФункциональностиСервера(Конфиг)

	Если ПараметрыФункциональностиСервера.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;

	Конфиг.ЗаписатьСтроку("features:");
	ЗаполнитьСекцию(Конфиг, ПараметрыФункциональностиСервера);

КонецПроцедуры

Процедура ЗаписатьПараметрыОтладкиСервера(Конфиг)

	Если ПараметрыОтладкиСервера.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;

	Конфиг.ЗаписатьСтроку("debug:");
	ЗаполнитьСекцию(Конфиг, ПараметрыОтладкиСервера);

КонецПроцедуры

#КонецОбласти
