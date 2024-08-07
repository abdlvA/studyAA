﻿#language: ru

@tree
@БыстрыеПроверки

Функционал: проверка заполнения полей документа Заказ покупателя

Как тестировщик я хочу
проверить заполнение полей документа Заказ покупателя
чтобы убедиться что пользователь не ошибется при вводе данных

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: подготовительный сценарий _загрузка данных
		И экспорт справочников для проверки шапки документа Заказ покупателя

Сценарий: проверка заполнения полей документа Заказ покупателя
	* Создание документа Заказ покупателя
		И я закрываю все окна клиентского приложения
		И Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
		И я нажимаю на кнопку с именем 'FormCreate'	
	* Проверка поля Контрагент
		Тогда элемент формы "Контрагент" не доступен 
		И я нажимаю кнопку выбора у поля с именем 'Partner'
		И в таблице 'List' я перехожу к строке:
			| "Код" | "Наименование"            |
			| "1"   | "Клиент 1 (1 соглашение)" |
		И в таблице 'List' я выбираю текущую строку
		Тогда элемент формы "Контрагент" доступен 	
	* Заполнение реквизитов Партнер и Соглашение с 1 соглашением 
		Тогда элемент формы "Контрагент" доступен 
		Тогда элемент формы "Контрагент" стал равен "Клиент 1"
		Тогда элемент формы "Партнер" стал равен "Клиент 1 (1 соглашение)"
		Тогда элемент формы "Соглашение" стал равен "Соглашение с клиентами (расчет по документам + кредитный лимит)"
	* Заполнение реквизитов Партнер и Соглашение с 2 соглашениями 
		И в поле с именем 'Partner' я ввожу текст ""
		И я нажимаю кнопку выбора у поля с именем 'Partner'
		И в таблице 'List' я перехожу к строке:
			| "Код" | "Наименование"            |
			| "2"   | "Клиент 2 (2 соглашения)" |
		И в таблице 'List' я выбираю текущую строку
		Тогда элемент формы "Контрагент" стал равен "Клиент 2"
		Тогда элемент формы "Партнер" стал равен "Клиент 2 (2 соглашения)"
		Тогда элемент формы "Соглашение" стал равен ""
		И я нажимаю кнопку выбора у поля "Соглашение"
		И в таблице 'List' я перехожу к строке:
			| "Вид"     | "Вид взаиморасчетов" | "Код" | "Наименование"                                        |
			| "Обычное" | "По соглашениям"     | "3"   | "Индивидуальное соглашение 2 (расчет по соглашениям)" |
		И в таблице 'List' я активизирую поле с именем 'Description'
		И я нажимаю на кнопку с именем 'FormChoose'
		Тогда открылось окно "Табличная часть товаров будет обновлена"
		И я нажимаю на кнопку с именем 'FormOK'
		И я закрываю все окна клиентского приложения